% module 7 exercise
%
% Radiocarbon dating

% define variables
N = 0:1e-1:100;                 % amount of remaining 14-carbon (percentage)
N0 = 100;                       % amount of 14-carbon when organism alive 
halfLife = 5700;                % 14- carbon half-life
lambda = log(2)/halfLife;       % decay rate

T = -(1/lambda) * log(N./N0);   % estimated time in years

plot(N,T)
