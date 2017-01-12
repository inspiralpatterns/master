%   02635 - Mathematical Software Programming
%   modul 11   
%   complexity test script

%%  1. matrix allocation / deallocation
clear; clc;
D = importdata('data.txt');

Y = zeros(length(D),1);
for i = 1:length(D)
    Y(i) = 2^i;
end

Y2 = zeros(length(D),1);
for i = 1:length(D)
    Y2(i) = 2^(i/2);
end

Y3 = zeros(length(D),1);
for i = 1:length(D)
    Y3(i) = i^2;
end

Y4 = zeros(length(D),1);
for i = 1:length(D)
    Y4(i) = i;
end

%% double logarithmic plot
loglog(D(:,1), D(:,2),'-s'); hold on;
loglog(D(:,1), Y,'-s'); hold on;
loglog(D(:,1), Y2,'-s'); hold on;
loglog(D(:,1), Y3,'-s'); hold on;
loglog(D(:,1), Y4,'-s'); hold on;
grid on;
legend(...
    'recursive function',...
    'exponential (2^n)',...
    'exponential (2^(n/2))',...
    'polynomial (n^2)',...
    'linear (n)'...
    )
title('loglog plot of time complexity for incresing Fibonacci series');
xlabel('time(ms)');
ylabel('function calls');
