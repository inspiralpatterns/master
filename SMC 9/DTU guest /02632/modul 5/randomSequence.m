function [r] = randomSequence(N,mu,R)
% randomSequence: return a sequence of N random numbers on the range
% described using mu and R
% (simulation refers to Monte Carlo Processes)
%
%   I/O
%   N: number of random draws (integer)
%   mu: mean of the distribution (scalar)
%   R: range of distribution (scalar)
%
%   r: random numbers (vector)

lowerBound = mu - R/2;
upperBound = mu + R/2;

r = unifrnd(lowerBound,upperBound,N,1);

end

