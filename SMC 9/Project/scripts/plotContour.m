function plotContour(data,gmm,n)
%   author:             Mattia Paterna
%   created:            January, 17th 2017
%   function name:      plotContour
%   purpose:            create a scatter plot for each MFCC label and add
%                       the contours of the gmm on the top
%   
%   input arguments
%       data:           data to be plotted
%       gmm:            mixture model to be used
%       n:              current grous (i.e. label)
%
%   output arguments: none

%   plot original data and the contours of the mixture model
%   obs: assuming data contains a selection or a reduction of the original
%   multidimensional dataset
    figure;
        
    xmin = min(data(:,1));
    xmax = max(data(:,1));
    ymax = max(data(:,2));
    ymin = min(data(:,2));
    
    %   obs: association to anonymous function
    ezcontour(@(x,y) pdf(gmm{n},[x,y]), [xmin xmax], [ymin ymax])
    hold on; axis equal; grid on;
    title('Scatter Plot and Fitted Gaussian Mixture Contours')
    gscatter(data(:,1),data(:,2));
    %set(gca,'LooseInset',get(gca,'TightInset'));
    hold off
    
    figure;
    ezsurf(@(x,y) pdf(gmm{n},[x,y]), [xmin xmax], [ymin ymax])
    title('Components inside the mixture and their pdf')

end