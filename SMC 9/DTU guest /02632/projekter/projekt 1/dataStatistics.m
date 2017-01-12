function [result] = dataStatistics(data, statistic)
% dataStatistics: calculate one of several possible statistics based on the
% data depending on the value of the 'statistic' string.
%
%   INPUT VARIABLES
%   data: data matrix
%   statistic: the statistic to be calculated (string)
%
%   OUTPUT VARIABLES
%   result: calculated statistic (scalar)

result = 0;

% make statistic unsensitive to capital letters
statistic = lower(statistic);

switch statistic
    case 'mean temperature'
        result = mean(data(:,1));
    case 'mean growth rate'
        result = mean(data(:,2));
    case 'std temperature'
        result = std(data(:,1));
    case 'std growth rate'
        result = std(data(:,2));
    case 'rows'
        result = length(data);
    case 'mean cold growth rate'
        result = mean(data(data(:,1) < 20,2));
    case 'mean hot growth rate'
        result = mean(data(data(:,1) > 50,2));
    otherwise 
        warning('Statistic does not match');
end

end

