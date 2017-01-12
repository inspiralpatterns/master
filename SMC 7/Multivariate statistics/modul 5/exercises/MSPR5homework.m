%% MSPR V homework
%% Exercise 2

%using the formula direct implementation
x = [1; 0];
mu = [0.5; 0.5];
sigma = [1 0;0.5 1];
F = (1/(2*pi.*(det(sigma).^0.5)))*exp((-0.5).*(x-mu)'*inv(sigma)*(x-mu))


%% Exercise 3

clear;
load gauss3.mat;

%calculating mean and variance for D0 and D1
mu0=mean(A0_tr);
mu1=mean(A1_tr);
sigma0=cov(A0_tr);
sigma1=cov(A1_tr);

%% Exercise 4

%plotting the histogram
[a0h,a0b]=hist(A0_tr(:,:));
[a1h,a1b]=hist(A1_tr(:,:));
bar(a0b,a0h/(size(A0_tr,1)*(a0b(2)-a0b(1))),'r'); hold on;
bar(a1b,a1h/(size(A1_tr,1)*(a1b(2)-a1b(1))),'b'); hold on;
legend('Training data A0','Training data A1');

%plotting gaussian over the histogram
x=-10:0.1:10;
F0=pdf('norm',x,mu0,sqrt(sigma0));
F1=pdf('norm',x,mu1,sqrt(sigma1));
plot(x,F0,'r'); hold on;
plot(x,F1,'b');

%both the two normal distributions doesn't fit at all the histograms.
%In the red case, the curve fits well the highest value but its slope is
%quite steep, discarding the value on the right.
%In the blue case, the dataset presents two peaks and the normal
%distribution doesn't fits none of those.


%% Exercise 5

%PCA on iris.set
fid = fopen('iris.data.txt');
data = textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1} data{2} data{3} data{4}];
species = data{5};
fclose(fid);

S=cov(X); %covariance matrix
[V,D]=eig(S); %eigenvalues decomposition
eigval=diag(D);
[s_eigval,I]=sort(eigval,'descend');
s_V=V(:,I); %sorted eigenvector matrix from highest to lowest

L=size(X,1);
Xc=X-ones(L,1)*mean(X); %centering data
scores=Xc*s_V(:,1); %scores for eigenvector with highest eigenvalue

%fitting two gaussian
%1.instance 6-50 of versicolor iris
idx_versicolor=find(strcmp(species,'Iris-versicolor') == 1);
idx_versicolor_tr=idx_versicolor(6:50);
mean_versicolor=mean(X(idx_versicolor_tr,:));%true mean
sigma_versicolor=cov(X(idx_versicolor_tr,:));%true variance

%2.instance of virginica iris
idx_virginica=find(strcmp(species,'Iris-virginica') == 1);
idx_virginica_tr=idx_virginica(6:50);
mean_virginica=mean(X(idx_virginica_tr,:));
sigma_virginica=cov(X(idx_virginica_tr,:));

%% testing 5 first instances of both species
%% a)using the full covariance matrix
idx_versicolor_test=idx_versicolor(1:5);%value to be tested
idx_virginica_test=idx_virginica(1:5);%value to be tested

F_versicolor=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_versicolor,sigma_versicolor);
F_virginica=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_virginica,sigma_virginica);

[F_versicolor F_virginica]
%no erroneus predictions have been done.

%% b)using the covariance matrix of type S=sigma*I
sigma_versicolor=mean(diag(sigma_versicolor))*diag(ones(4,1));
sigma_virginica=mean(diag(sigma_virginica))*diag(ones(4,1));

F_versicolor=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_versicolor,sigma_versicolor);
F_virginica=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_virginica,sigma_virginica);

[F_versicolor F_virginica]
%2 erroneus predictions have been done.

%% Exercise 6
%2. very seriously
%3. quite seriously
%4. very seriously
%5. seriously