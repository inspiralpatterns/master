%% module 5 assignments
%
% Temperature conversion

function [T] = convertTemperature(T,unitFrom,unitTo)
% convertTemperature: converts temperature between three different units of
% measurements
%
%   I/O
%   T: input temperature (decimal)
%   unitFrom: input unit temperature (string)
%   unitTo: output unit temperature (string)
%
%   T: converted temperature (decimal)

if strcmp(unitFrom, 'Celsius') == 1
    switch unitTo
        case 'Fahrenheit'
            T = 1.8*T + 32;
        case 'Kelvin'
            T = T + 273.15;
    end
elseif strcmp(unitFrom, 'Fahrenheit') == 1
        switch unitTo
        case 'Celsius'
            T = (T - 32)/1.8;
        case 'Kelvin'
            T = (T + 459.67)/1.8;
        end
else
    switch unitTo
        case 'Celsius'
            T = T - 273.15;
        case 'Fahrenheit'
            T = 1.8 * (T - 459.67);
    end
end

end

