function plotwLabel(data,x,y,groups)
%   author:             Mattia Paterna
%   created:            January, 18th 2017
%   function name:      plotwLabel
%   purpose:            create a scatter plot for all MFCC originating from
%                       an event structure, according to their grouping.
%                       A label for each point is included
%   
%   input arguments
%       data:           data to be plotted
%       x:              first dimension to be plotted (x axis)
%       y:              second dimension to be plotted (y axis)
%       groups:         sequence of numbers to be used to divide data into
%                       groups corresponding to the main labels
%
%   output arguments: none


figure;
axis equal; grid on;

%   plot all points and keep 
gscatter(data(:,x),data(:,y),groups); hold on

for n = 1:length(groups) 
    %   create a string for each point and add description to it
    pointLabel = sprintf('  %d', n);
    text(data(n,x),data(n,y),pointLabel);
end

title(['Data plot using',x,'and',y,'dimensions, with labels'])

end