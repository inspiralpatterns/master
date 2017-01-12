% module 2 assignments
%
% projection

function [p] = computeProjection(a)
%e compute projection: computes the projection of b = [1,1,..] onto the
% input vector.
%   I/O
%   a: input vector
%   p: projection vector

b = ones(length(a),1);
p = (a*b)/(norm(a)^2)*a;

end