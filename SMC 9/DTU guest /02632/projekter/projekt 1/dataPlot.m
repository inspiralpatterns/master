function dataPlot(data)
% dataPlot: generate two plots
%   1. number of items for each different type of bacteria;
%   2. growth rate by temperature
%
%   INPUT VARIABLES
%   data: N x 3 data matrix
%
%   output: none

noBacteria = 4;
y = zeros(1,noBacteria);
n = 1;

% group the data according to their bacteria type
while n <= noBacteria
y(n) = length(data(data(:,3) == n));
n = n + 1;
end

% make subplots in one figure window
figure;
% plot no. 1
subplot(2,1,1);
bar(1:noBacteria,y,0.5,'r');    % create a bar plot
title('Number of Bacteria');
xlabel('Bacteria types'); ylabel('No. of elements');

% plot no. 2
subplot(2,1,2);
xlim([10 60]);      % limits for x axis

for n = 1:noBacteria
    % for each type, get temperatures, growth and sort them in ascending
    % order so to make the plot clear
    temp = data(data(:,3) == n,1);
    growth = data(data(:,3) == n,2);
    plot(temp,growth,'*');
    hold on;
end

title('Growth rate by temperature');
xlabel('Temperature'); ylabel('Growth rate');
legend('Type1','Type2','Type3','Type4','Location','northwest');

end

% ask if scatterplot is the most convenient way of representing spread data

