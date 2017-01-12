%   02635 - Mathematical Software Programming
%   Assignment 2   
%   CPU time testing script

%%  1. matrix allocation / deallocation
clear; clc;
M = importdata('matrix_cpu_result.txt');
V = importdata('vector_cpu_result.txt');
BLAS = importdata('dgesv_cpu_result.txt');

Y = zeros(8,1);
for i = 1:8
    Y(i) = 2^(2+i);
end

mean_M = mean(M,2);
mean_V = mean(V,2);
mean_BLAS = mean(BLAS,2);

%   checking for dimension mismatch error
if (~isequal(length(Y), length(mean_M)) || ~isequal(length(Y), length(mean_V)))
    warning('dimension mismatch!')
end


%% double logarithmic plot
loglog(Y,mean_M,'-s'); hold on;
loglog(Y,mean_V,'-s'); hold on;
loglog(Y,mean_BLAS,'-s');
grid on;
legend(...
'matrix allocation time',...
'vector allocation time',...
'dgesv time');
title('loglog plot of CPU time for incresing orders of a system of linear equation');
xlabel('order of system of linear equation');
ylabel('time (ms)');
