%% Probability distribution
%% Class assignment

fid = fopen('iris.data.txt');
data = textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1} data{2} data{3} data{4}];
species = data{5};
fclose(fid);
%alternative: 'data_path' = '/path/to/file';
%fid = fopen[data_path, 'file_name');

%get the indexes with specific matching
idx_versicolor=find(strcmp(species,'Iris-versicolor') == 1); 

[hdp,bdp]=hist(X(idx_versicolor,4),0:0.2:2.5);%distribution probability
[hmp,bmp]=hist(X(:,4),0:0.2:2.5);%marginal probability

figure;
bar(bmp, hmp,'r'); hold on; 
bar(bdp, hdp,'b');
legend('Marginal prob. P(feat|peat width)', 'Conditional prob. P(petal width | species versicolor');

%% Normal distribution

mu = 0;
sigma = 2;
pd = makedist('Normal',mu,sigma);

%cumulative distribution function
y = cdf(pd, [-sigma,sigma]);
prob = y(2) - y(1);


%class assignemnt
y = cdf(pd, [-2*sigma, 2*sigma]);
prob = 1 - (y(2) - y(1));

%The significance level, also denoted as alpha or ?, 
%is the probability of rejecting the null hypothesis when it is true

%% Fitting gaussian to a histogram

clear;
load gauss3.mat;

x = -10:0.2:10;
[h,p] = hist(A0_tr);
figure;
bar(p, h/((p(2)-p(1))*size(A0_tr,1)),'b'); hold on;
mu = mean(A0_tr);
sigma = var(A0_tr);

y = pdf('norm',x,mu,sqrt(sigma));

%y = (1/(sigma*sqrt(2*pi)))*exp(-(((x-mu).^2)/2*(sigma^2)));
plot(x,y,'r');


%% Multivariate Gaussian

mu = [0 0];
Sigma1 = [1 0.5;0.5 1];
x1 = -3:0.2:3;
x2 = -3:0.2:3;
[X1,X2] = meshgrid(x1,x2); %check meshgrid

F = mvnpdf([X1(:) X2(:)],mu,Sigma1); %find the Gaussian
F = reshape(F,length(x2),length(x1)); %reshape the matrix

figure(1)
surf(x1,x2,F);
figure(2)
contour(X1,X2,F);

%class assignment
Sigma3 = [1 -0.8;-0.8 1];
F3 = mvnpdf([X1(:) X2(:)],mu,Sigma3);
F3 = reshape(F,length(x2),length(x1));

figure(3)
surf(x1,x2,F3);
figure(4)
contour(X1,X2,F3);

%% Fitting a Gaussian to multidimensional data

fid = fopen('iris.data.txt');
data = textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1} data{4}];
species =data{5};
fclose(fid);

idx_virginica=find(strcmp(species,'Iris?virginica') == 1);
idx_virginica_tr=idx_virginica(6:50);
hist3(X(idx_virginica_tr,:));
sig_virginica=cov(X(idx_virginica_tr,:));
mean_virginica=mean(X(idx_virginica_tr,:));

x1 = min(X(:,1)):0.2:max(X(:,1));
x2 = min(X(:,1)):0.2:max(X(:,1));
[X1,X2] = meshgrid(x1,x2); %check meshgrid

F_virginica = mvnpdf([X1(:) X2(:)], mean_virginica, sig_virginica);
F_virginica = reshape(F_virginica, length(x2),length(x1));






