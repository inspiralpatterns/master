function plotEvents(data,synData,x,y,groups,mode)
%   author:             Mattia Paterna
%   created:            January, 15th 2017
%   last edit:          January, 18th 2017
%   function name:      plotEvents
%   purpose:            create a scatter plot for all MFCC originating from
%                       original timestamps, according to their group and
%                       the corresponding synthetic data
%   
%   input arguments
%       data:           original data to be plotted
%       synData:        synthetic data to be plotted
%       x:              first dimension to be plotted (x axis)
%       y:              second dimension to be plotted (y axis)
%       groups:         sequence of numbers to be used to divide data into
%                       groups corresponding to the main labels
%       mode:           determine the structure of the plot
%                       'separate': a subplot for each data set
%                       'joint': both data set plots together
%
%   output arguments: none


figure;

if isempty(mode) == 1
    %   if mode not provided, default: subplots
    mode = 'joint';
end

switch mode
    case 'separate'
        subplot(2,1,1);
        gscatter(data(:,x),data(:,y),groups,'rgb');
        title('Original data from t-SNE low-dimension mapping')
        axis equal; grid on;

        subplot(2,1,2);
        gscatter(synData(:,x),synData(:,y),groups,'rgb');
        title('Synthetic data from t-SNE low-dimension mapping')
        grid on; axis equal;


    case 'joint'
        gscatter(data(:,x),data(:,y),groups,'rgb','o',8,'off'); 
        hold on
        gscatter(synData(:,x),synData(:,y),groups,'rgb','x',8,'off');
        title(['Original and synthetic data from t-SNE low mapping'])
        axis equal; grid on;
        
        %   plot legend
        ax = gca;
        x = ax.XLim(2);
        y = ax.YLim(1);
        
        %   heuristic for the legend to be inside the axes
        if y < 0
            y = y + 0.2;
        end
        
        str = {'o : original data','x : synthetic data'};
        text(x,y,str,'FontSize',10,'FontWeight','bold',...
            'HorizontalAlignment','right');
        
end


end

