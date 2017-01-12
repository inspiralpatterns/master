%%                     MOOG 904B HIGHPASS FILTER
%
%                   *** TPT high-pass filter *** 
%   based on improved ladder filter model by Välimäki, V, 'Oscillator and 
%   Filter Algorithms for Virtual Analog Synthesis', Computer Music Journal
%   
%   assumption: when Cres = 0 and coef set according to the analog fully
%   highpass filter transfer function, it is possible to achieve the same
%   behaviour as our implementation.
%
%   Author: Diego Di Carlo, Mattia Paterna
%   Date:   07 June 2016

%   read an audio file and allocate buffers
audiofile = 'prototype';

switch audiofile
    case 'external'
        [X,fs] = audioread('beethoven.wav');
    case 'prototype'
        if exist('fs') == 0
            fs = 44100; 
        end
        t = (linspace(0,2*pi,fs))';
        X = square(2*t);    % create pulse wave with duty cycle = 0.5
end
Y = zeros(length(X),1);

%   allocate variables
z = zeros(4,1);   
lp = zeros(4,1);
out = 0;

%   set coefficients for high pass behaviour
coef = [1,-4,6,-4,1];
toSum = zeros(5,1);

T = 1/fs;
E = 0.075;               % differential mode control signal

switch_pos = 'High';
filtermode = 'True Analog';

switch filtermode
    case 'True Analog'
        omega_a = getRCFreq(E,switch_pos);
    case 'Discrete Freq'
        % define discrete-time cutoff frequency (in Hz)
        cutoff = 5000;

        % pre-warp the cutoff (bilinear-transform filters) stage
        omega_d = 2*pi*cutoff;  % Hz to radians
        omega_a = (2/T)*tan(omega_d*T/2);   % get the analog-tuned frequency
end

g  = omega_a*T/2;

%   big combined gain factor value
G = g/(1 + g); 

%   other values for recursive path
Cres = 0;
Gcomp = 0.8;
Gres = Cres * (1.0029 + 0.0526*omega_a - 0.0926*(omega_a^2) + 0.0218*(omega_a^3));

%   do filtering, see VA book p. 46 (trapezoidal integration)
for n = 1:length(X)
    %   assign values to local variable
    x = X(n);
        
    %   input to first HP stage (and waveshaping for nonlinearities)
    in = tanh(x - (4*Gres*(out - Gcomp*x)));
 
    %   do filtering for each stage using the appropriate gain factor
    for i = 1:4
        toSum(i) = coef(i)*in;
        [out,lp(i)] = singleStageLadder(in,z(i),G);
        z(i) = out;
        in = out;
    end

    toSum(end) = coef(end)*out;
    
    %   write outcoming filtered signal onto the output buffer
    Y(n) = sum(toSum);

end
