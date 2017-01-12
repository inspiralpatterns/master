%% Section 1
a = 4+4
b = a^2

%% Section 2
b = 5

%% Pythagoras
a = 3; b = 4;
c  =sqrt(a^2 + b^2)

%% Vectors
b = [1; 2; 3]
b = [1, 2, 3]
%inverse matrix (transposition)
b = b'
%array multiplication (element-wise)
p = c .* b
%inner product
p = b * c'
%outer product
p = b' * c

%% Matrices
B = [1 2 3 4; 5 6 7 8; 9 10 11 12]
%matrix addition
B + 5
%matrix scalar multiplication
B * 2
%short-way to create matrices
t = 0:9
t = [0:0.1:9]

%calling element on a specified index
%NB: indexes in Matlab start from 1, instead of 0 as in C/C++
B(1)
B(2,2)
%you can call the last element of a row or a column using 'end'
B(2,end)
%all the value of a column
B(:,4)
%all the value of a row
B(3,:)

%% Plotting data
%hint: using 'clear' to delete all the variables
clear

x = -1:0.1:1;
y = x .^2;
plot(x,y, 'r');
%keep the previous graph
hold on;
%plot another one on the same figure
plot(x, sqrt(x), 'b');
%add some legend
legend('x^2', 'sqrt(x)');
xlabel('x');
ylabel('y');
%add a title
title('vivalamerda');

%% Plotting exponentials
t = [-2:0.1:2];
%in this case, a and lambda are constants
a = 1;
lambda = 1;
y = a * exp(lambda.*t);
plot(t, y)

%% Plotting Gaussian
x = [-4:0.01:4];
%simple Gauss function
y = exp(-x.^2);
plot (x,y);
title('e^(-x^2)');

%% How to read data
clear
textread('series.txt');
%save as variable binary
save('series.mat');

clear
%reload variables in the workspace
load series.mat

%% Reading with textscan
%the 'fid' is the reading facility pointer which the scan starts from
% fid = file identifier

fid = fopen('filename');
data = textscan(fid, '%f%s%f', 'delimiter', ',');
fclose(fid);

%% Class assignemnt - The Iris Dataset
fid = fopen('iris.data.txt');
data = textscan(fid, '%f%f%f%f%s', 'delimiter', ',')
fclose(fid);

feat = [data{1} data{2} data{3} data{4}];
%scatter plot
figure(1);
scatter(feat(:,1),feat(:,3));
%histograms
figure(2);
histogram(feat(:,1));
figure(3);
histogram(feat(:,4));
%bivariate histogram
figure(4);
hist3(feat(:, 3:4));

%% PRTools
%add prtools path to Matlab
prpath = '/Librerie/prtools';
addpath(prpath)

%build a dataset 
z = prdataset(feat, data{5}, 'featlab', ['sepal length'; 'sepal width '; 'petal length'; 'petal width '], 'name', 'Iris Dataset');
figure(1); scatterd(z);

z34 = prdataset([data{3}, data{4}], data{5}, 'featlab', ['petal length'; 'petal width '], 'name', 'Iris Dataset');
figure(2); scatterd(z34);


%% Sounds
%read and play
[x sr] = audioread('handel.wav');
soundsc(x,sr);

%write sound
audiowrite('eidel1.wav', x/2, sr);
        







