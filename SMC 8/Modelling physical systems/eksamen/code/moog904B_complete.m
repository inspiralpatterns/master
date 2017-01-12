%%                     MOOG 904B HIGHPASS FILTER
%
%                   *** TPT high-pass filter ***
%   based on model presented in: 'Virtual Analog (VA) Filter Implementation 
%   and Comparisons', Will Pirkle, 2013. 
%
%   Author: Diego Di Carlo, Mattia Paterna
%   Date:   07 June 2016

% read/create an audio file and allocate buffers
audiofile = 'prototype';

switch audiofile
    case 'external'
        [x,fs] = audioread('beethoven.wav');
    case 'prototype'
        if exist('fs') == 0
            fs = 44100; 
        end
        t = (linspace(0,2*pi,fs))';
        x = square(2*t);    % create pulse wave with duty cycle = 0.5
end
y = zeros(length(x),1);

% allocate variables
filter_z = zeros(4,1);  % to store each current filter state  
filter_out = 0;         % to store the current output for each iteration

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

g  = omega_a*T/2;   % get istantaneous response gain

% big combined gain factor value for zero-delay feedback structure
G = g/(1 + g); 

% do filtering, see VA book p. 46
for n = 1:length(x)
    % assign values to local variable
    filter_in = tanh(x(n)); % Huovilainen nonlinearities modelling
 
    % do filtering for each stage using the appropriate gain factor
    for i = 1:4
        [filter_z(i),filter_out] = singleStage904B(filter_in,filter_z(i),G);
        filter_in = filter_out;
    end
    
    % write outcoming filtered signal onto the output buffer
    y(n) = filter_out;

end