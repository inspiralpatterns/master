%% module 4 assignments
%
% Fermentation rate

function [averageRate] = fermentationRate(measuredRate, lowerBound, upperBound)
% fermentationRate: computes and return the mean fermentation rate, taking
% only valid measurements into account
%   I/O
%   measuredRate: measured fermentation rates (vectors)
%   lowerBound: lower bound for valid measurements (scalar)
%   upperBound: upper bound for valid measurements (scalar)
%
%   averageRate: average fermentation of valid measurements (scalar)

validRate = measuredRate((measuredRate > lowerBound) & (measuredRate < upperBound));
averageRate = mean(validRate);

end

