% module 2 assignments
%
% Taylor series

function [y] = evaluateTaylor(x)
% evaluateTaylor
%   INPUT 
%   x: real scalar value

tmp = x-1;
y = (tmp) - 1/2*((tmp).^2) + 1/3*((tmp).^3);

end