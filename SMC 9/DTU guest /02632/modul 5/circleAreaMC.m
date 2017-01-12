%% module 5 assignments
%
% Monte Carlo estimation

function [A] = circleAreaMC(xvals, yvals)
% circleAreaMC: estimates the area of a circle using a Monte Carlo
% simulation
%
%   I/O
%   xvals: x-coordinates of points (vector)
%   yvals: y-coordinates of points (vector)
%
%   A: estimated value for the area (scalar)

% variable declaration
N = length(xvals);
n = 0;

% check how many points are inside the circle
for i = 1:length(xvals)
    coord = [xvals(i) yvals(i)];
    if norm(coord) < 1
        n = n + 1;
    end
end

% circle area estimation
A = 4 * n/N;
end