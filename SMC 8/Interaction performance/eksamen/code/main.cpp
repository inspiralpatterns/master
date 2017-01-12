#define _USE_MATH_DEFINES
//#define _WINSOCK_DEPRECATED_NO_WARNINGS				// needed only on Microsoft systems (remove for UNIX systems)

// STD libraries
#include <cmath>
#include <iostream>
#include <iomanip>
#include <stdexcept>
#include <string>
#include <algorithm>

// Myo library
#include <myo/myo.hpp>

// UDP libraries (UNIX systems)
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

// UDP libraries (MICROSOFT systems)
//#include <winsock2.h>
//#include <WS2tcpip.h>

// DataCollector is a class that inherits from Myo::DeviceListener.
// Objects of type DeviceListener receive events from the Myo. Virtual function of the class DeviceListener must
// be overriden here, otherwise the default behaviour is to do nothing.
class DataCollector : public myo::DeviceListener {
public:
    DataCollector()
    : onArm(false), isUnlocked(false), roll_w(0), pitch_w(0), yaw_w(0), currentPose(),
    previousPose(myo::Pose::unknown), toSend(false), UDPbuffer("")
    {
    }
    
    // onPair() is called whenever the Myo is connected to Myo Connect by the user.
    void onPair(myo::Myo* myo, uint64_t timestamp, myo::FirmwareVersion firmwareVersion) {
        std::cout << "Myo connected." << std::endl;
    }
    
    // onUnpair() is called whenever the Myo is disconnected from Myo Connect by the user.
    void onUnpair(myo::Myo* myo, uint64_t timestamp)
    {
        // We've lost a Myo.
        std::cout << "Myo disconnected." << std::endl;
        // Let's clean up some leftover state.
        roll_w = 0;
        pitch_w = 0;
        yaw_w = 0;
        onArm = false;
        isUnlocked = false;
    }
    
    // onArmSync() is called whenever Myo has recognized a Sync Gesture after someone has put it on their
    // arm. This lets Myo know which arm it's on and which way it's facing.
    void onArmSync(myo::Myo* myo, uint64_t timestamp, myo::Arm arm, myo::XDirection xDirection, float rotation,
                   myo::WarmupState warmupState)
    {
        onArm = true;
        whichArm = arm;
        std::cout << "Myo synced." << std::endl;
    }
    
    // onArmUnsync() is called whenever Myo has detected that it was moved from a stable position on a person's arm after
    // it recognized the arm. Typically this happens when someone takes Myo off of their arm, but it can also happen
    // when Myo is moved around on the arm.
    void onArmUnsync(myo::Myo* myo, uint64_t timestamp)
    {
        onArm = false;
        std::cout << "Myo not synced. Please make sync gesture..." << std::endl;
    }
    
    // onUnlock() is called whenever Myo has become unlocked, and will start delivering pose events.
    void onUnlock(myo::Myo* myo, uint64_t timestamp)
    {
        isUnlocked = true;
        std::cout << "unlocked" << std::endl;
    }
    
    // onLock() is called whenever Myo has become locked. No pose events will be sent until the Myo is unlocked again.
    void onLock(myo::Myo* myo, uint64_t timestamp)
    {
        isUnlocked = false;
        std::cout << "locked" << std::endl;
    }
    
    // onOrientationData() is called whenever the Myo device provides its current orientation, which is represented
    // as a unit quaternion.
    void onOrientationData(myo::Myo* myo, uint64_t timestamp, const myo::Quaternion<float>& quat)
    {
        using std::atan2;
        using std::asin;
        using std::sqrt;
        using std::max;
        using std::min;
        
        // Calculate Euler angles (roll, pitch, and yaw) from the unit quaternion.
        float roll = -atan2(2.0f * (quat.w() * quat.x() + quat.y() * quat.z()),
                            1.0f - 2.0f * (quat.x() * quat.x() + quat.y() * quat.y()));
        float pitch = asin(max(-1.0f, min(1.0f, 2.0f * (quat.w() * quat.y() - quat.z() * quat.x()))));
        float yaw = -atan2(2.0f * (quat.w() * quat.z() + quat.x() * quat.y()),
                           1.0f - 2.0f * (quat.y() * quat.y() + quat.z() * quat.z()));
        
        // Define an active range of angles for controlling the volume and
        // convert the angle values to a scale from 0 to 1.
        float rollLowerLim = -1.10;                                 // Minimum roll value for active range
        float rollUpperLim = 1.1;                               // Maximum roll value for active range
        if (roll >= rollLowerLim && roll <= rollUpperLim)
            roll_w = static_cast<int>(( fabs(roll - rollLowerLim) / fabs(rollUpperLim - rollLowerLim) ) * 100);            // roll rescaling
        else if (roll > rollUpperLim) roll_w = 99;
        else roll_w = 0;
        
        float pitchLowerLim = -0.30;                                 // Minimum pitch value for active range
        float pitchUpperLim = 0.70;                               // Maximum pitch value for active range
        if (pitch >= pitchLowerLim && pitch <= pitchUpperLim)
            pitch_w = static_cast<int>(( fabs(pitch - pitchLowerLim) / fabs(pitchUpperLim - pitchLowerLim)) * 100);            // pitch rescaling
        else if (pitch > pitchUpperLim) pitch_w = 99;
        else pitch_w = 0;
        //std::cout << yaw << std::endl;
        float yawLowerLim = -1.5;                              // Minimum yaw value for active range
        float yawUpperLim = -0.2;                               // Maximum yaw value for active range
        if (yaw >= yawLowerLim && yaw <= yawUpperLim)
            yaw_w = static_cast<int>(( fabs(yaw - yawLowerLim) / fabs(yawUpperLim - yawLowerLim)) * 100);            // yaw rescaling
        else if (yaw > yawUpperLim) yaw_w = 99;
        else if (yaw < yawLowerLim) yaw_w = 0;

    }
    
    // onPose() is called whenever the Myo detects that the person wearing it has changed their pose, for example,
    // making a fist, or not making a fist anymore.
    void onPose(myo::Myo* myo, uint64_t timestamp, myo::Pose pose)
    {
        currentPose = pose;
        
        if (pose == myo::Pose::doubleTap) {
            if (isUnlocked == false) myo->unlock(myo::Myo::unlockHold);
            else myo->lock();
        }
        
        if (pose == myo::Pose::fist) {
            myo->vibrate(myo::Myo::vibrationShort);
        }
        
        if (pose == myo::Pose::fingersSpread) {
            myo->vibrate(myo::Myo::vibrationShort);
            myo->vibrate(myo::Myo::vibrationShort);
        }
        
        if (pose == myo::Pose::waveIn || pose == myo::Pose::waveOut) {
            myo->vibrate(myo::Myo::vibrationMedium);
        }
    }
    
    // UDPmessage() sets up the messages for the MAX patch depending on the pose
    void UDPmessage()
    {
        toSend = false;			// reset variable
        
        // Here nothing is done if the Myo is locked.
        if (isUnlocked == true) {
            
            // Command selection
            switch (currentPose.type()) {
                    
                    // scattering on/off
                case myo::Pose::waveIn: {
                    if (currentPose != previousPose) {
                        UDPbuffer = "rdur";
                        toSend = true;
                    }
                    break;
                }
                    
                    // random grain amplitude on/off
                case myo::Pose::waveOut: {
                    if (currentPose != previousPose) {
                        UDPbuffer = "sctr";
                        toSend = true;
                    }
                    break;
                }
                    
                    // speed control (continuous)
                case myo::Pose::fist: {
                    UDPbuffer = "s " + std::to_string(roll_w);
                    toSend = true;
                    break;
                }
                    
                    // A/B crossfade control (continuous)
                case myo::Pose::fingersSpread: {
                    UDPbuffer = "c " + std::to_string(roll_w);
                    toSend = true;
                    break;
                }
                    
                    // Volume and density control (continuous)
                case myo::Pose::rest: {
                    UDPbuffer = "g " + std::to_string(pitch_w) + " d " + std::to_string(yaw_w);
                    toSend = true;
                    break;
                }
            }
            
            previousPose = currentPose;				// update previous
        }
    }
    
    // These values are set by onArmSync() and onArmUnsync() above.
    bool onArm;
    myo::Arm whichArm;
    
    // This is set by onUnlock() and onLock() above.
    bool isUnlocked;
    
    // These values are set by onOrientationData() and onPose() above.
    int roll_w, pitch_w, yaw_w;
    myo::Pose currentPose;
    
    // These values are set by onPose() and UDPmessage() above.
    myo::Pose previousPose;
    bool toSend;
    std::string UDPbuffer;
};




//==========================================================================
// MAIN
//==========================================================================
int main(int argc, char** argv) {
    // Catch any exceptions that might occur below -- see the catch statement for more details.
    try {
        
        //==========================================================================
        // INITIALIZATION
        //==========================================================================
        
        // Create a Hub. A hub provide access to the myo.
        // It's possible to add a string as application identifier --> see Hub::Hub() instructions
        myo::Hub hub("");
        
        // disable the standard locking behaviour
        hub.setLockingPolicy(myo::Hub::lockingPolicyNone);
        
        // waitForMyo() returns a pointer to a myo::Myo object
        myo::Myo* myo = hub.waitForMyo(10000);
        
        // if a myo is not founded, throw an exception
        if (!myo) {
            throw std::runtime_error("Unable to find a Myo!");
        }
        
        // Construct a DeviceListener (it receives events from the Myo)
        DataCollector collector;
        
        // Add the DeviceListener to the hub. When Hub::run() is called all events are sent to added listeners.
        hub.addListener(&collector);
        
        
        //==========================================================================
        // UDP CONNECTION SETTINGS
        // need to change port number (portNum) or ip-address(ipAddress)? DO IT HERE!
        //==========================================================================
        
        // UDP connection settings (set ipAddress to 127.0.0.1 for local communication)
        const int portNum = 9000;
        const char ipAddress[] = "127.0.0.1";
        const int bufferLength = 4;							// ******NOTE: not needed anymore
        
        int clientSocket, nBytes;
        struct sockaddr_in serverAddr;
        socklen_t addr_size;
        
        /*Create UDP socket*/
        clientSocket = socket(PF_INET, SOCK_DGRAM, 0);
        
        /*Configure settings in address struct*/
        serverAddr.sin_family = AF_INET;
        serverAddr.sin_port = htons(portNum);      // port
        serverAddr.sin_addr.s_addr = inet_addr(ipAddress);  // local address (16777343)
        memset(serverAddr.sin_zero, '\0', sizeof serverAddr.sin_zero);
        
        /*Initialize size variable to be used later on*/
        addr_size = sizeof serverAddr;
        
        
        
        //==========================================================================
        // WHILE LOOP - get events from myo and execute actions
        //==========================================================================
        
        while (1) {
            
            hub.run(1000 / 20);
            collector.UDPmessage();
            
            // Send UDP message
            if (collector.toSend == true) {
                const char* UDParray = collector.UDPbuffer.c_str();
                nBytes = sizeof(UDParray);
                sendto(clientSocket, UDParray, nBytes, 0, (struct sockaddr *)&serverAddr, addr_size);
                std::cout << "Message sent: " << collector.UDPbuffer << std::endl;
            }
        }
        
    }
    
    
    //==========================================================================
    // EXCEPTION CATCH
    //==========================================================================
    // If a standard exception occurred, we print out its message and exit.
    catch (const std::exception& e) {
        std::cerr << "Error: " << e.what() << std::endl;
        std::cerr << "Press enter to continue.";
        std::cin.ignore();
        return 1;
    }
    
    
}