%% Exercise 2

x = -8:0.01:8;
sigma = 2;
mu = 2;

%Gauss function
y = (1/(sigma*sqrt(2*pi)))*...
    exp(-(((x - mu).^2)/(2*(sigma^2))));
plot(x,y);
title('Normal Distribution');
xlabel('x');
ylabel('y');


%% Exercise 3 
%% (3.1 is inside the function)

fid = fopen('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/numbers.txt');
data = textscan(fid, '%f%f%f');
fclose(fid);

feat = [data{1}; data{2}; data{3}];
analyzeNumbers(feat);

clear;

fid = fopen('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/numbers.txt');
data = textscan(fid, '%f%f%f');
fclose(fid);
feat = [data{1} data{2} data{3}]

open('new_numbers.mat')


%% Exercise 4

clear;
clc;
prpath = '/Librerie/prtools';
addpath(prpath);

fid = fopen('adult.data.txt');
data = textscan(fid, '%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s',...
    'delimiter', ',');
fclose(fid);

features = [data{1} data{13}];
labels = [data{15}];
featlab = [
    'Age   ';
    'H-p-w ';
    'Income'
    ];

z = prdataset(features, labels, 'featlab', featlab, 'name', 'Adult Census');
scatterd(z);
[n, labels] = classsizes(z)

%% Exercise 5
%% 5.1 - voice dominance

%read the files
[x sr] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/bass.wav');
[y sr] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/vox.wav');

x = x/10;
mix = x + y;
sound(mix, sr);
plot(x);

%% 5.2 - bass dominance

x = x * 10;
y = y / 10;
mix = x + y;
sound(mix, sr);


%% Self assessment

2. yes
3. yes
4. yes
5. yes
