% module 6 assignments
%
% production cost

function [ysmooth] = movingAvg(y)
% movingAvg: computes the five-sample weigthed moving average of the signal
%
%   I/O
%   y: input signal (vector)
%
%   ysmooth: five-sample moving average smoothing of input (vector)

switch length(y)
    case 1
        A = y*3;
    case 2
        A = [y(2:end)*2 zeros(1,1); y*3; zeros(1,1) y(1:end-1)*2];
    otherwise
    A = [y(3:end) zeros(1,2);y(2:end)*2 zeros(1,1); y*3;... 
        zeros(1,1) y(1:end-1)*2; zeros(1,2) y(1:end-2)];
end

ysmooth = sum(A)/9;
end


%-----------ISSUES-----------
% what if the signal is one-sample long?
%
% is it possible to use a loop instead?