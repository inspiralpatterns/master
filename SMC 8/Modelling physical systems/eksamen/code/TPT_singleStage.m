%% TPT high-pass filter 

% read an audio file and allocate buffers
[x,fs] = audioread('beethoven.wav');
y = zeros(length(x),1);

% define unit-sample delay and filter variable
z = 0;                                                                     
hp = 0;

% define cutoff frequency (in Hz)
cutoff = 5000;
                                                     
% do filtering, see VA book p. 46
% form sub-node value v(n)

for n = 1:length(x)
    % pre-warp the cutoff (bilinear-transform filters) stage
    omega_d = 2*pi*cutoff;
    T = 1/fs;
    omega_a = (2/T)*tan(omega_d*T/2);
    g  = omega_a*T/2;

% big combined value
    G = g/(1.0 + g); 
    v = (x(n) - z)*G;

    % form output of node + register 
    % (hp is the output variable for HPF)
    lp = v + z;
    hp = x(n) - lp;

    % setup for next time through
    z = lp + v;
    
    % write output onto the buffer
    y(n) = hp;
end
