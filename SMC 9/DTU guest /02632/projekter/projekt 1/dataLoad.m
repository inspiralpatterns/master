function [data] = dataLoad(filename)
% dataLoad: read the data contained in a data file
%
%   INPUT VARIABLES
%   filename: data file filename (string)
%
%   OUTPUT VARIABLES
%   data: matrix containing data, divided in 3 columns

fid = fopen(filename);              % file identifier

% check for the existence
while fid == -1
    warning('file not found.');
    filename = input('Insert a valid filename: ', 's');
    fid = fopen(filename);
end

line = 1;                           % line of text to be read
data = [];

while feof(fid) == 0                % repeat the loop until the test for EOF is true
    % read each line and convert it to an array
    aLine = str2num(fgetl(fid));
    
    % check for data errors
    if aLine(1) < 10 || aLine(1) > 60
        warning('line %d: temperature exceeding range', line);
    elseif aLine(2) < 0
        warning('line %d: growth rate not a positive number', line);
    elseif aLine(3) < 0 || aLine(3) > 4
        warning('line %d: bacteria field not present', line);
    elseif mod(aLine(3),1) ~= 0
        aLine(3) = floor(aLine(3));
    else
        % write the correct data into the output matrix
        data = [data; aLine];
    end
    
    % update lines counter
    line = line + 1;
end

end

