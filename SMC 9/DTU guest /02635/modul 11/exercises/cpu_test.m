%   02635 - Mathematical Software Programming
%   modul 11   
%   cpu time test script

%%  1. matrix allocation / deallocation
clear; clc;
R = importdata('data.txt');
I = importdata('cputime.txt');

Y = zeros(length(R),1);
for i = 1:length(R)
    Y(i) = i;
end

%% double logarithmic plot
loglog(R(:,2), Y,'-s'); hold on;
loglog(I, Y,'-s'); hold on;
grid on;
legend(...
    'recursive version',...
    'iterative version'...
    )
title('loglog plot of cpu time of two version of Fibonacci algorithm');
xlabel('time');
ylabel('N');
