%% MSPR Lecture VI 8/X/15

fid = fopen('iris.data.txt');
data = textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1} data{4}];
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

%% class assignment
%%calculate the pooled covariance matrix for species Virginica and
%%Versicolor using the previously estimated class sample covariance

idx_versicolor_test=idx_versicolor(1:5);%value to be tested
idx_virginica_test=idx_virginica(1:5);%value to be tested

%average covariance matrix over the previously covariance matrices
pooled_sigma=(sigma_versicolor+sigma_versicolor)/2
pooled_sigma=mean(sigma_versicolor+sigma_virginica)

F_versicolor=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_versicolor,pooled_sigma);
F_virginica=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_virginica,pooled_sigma);


%% class assignment
%%mean variance of the pooled covariance matrix S
pooled_sigma=mean(diag(pooled_sigma))*diag(ones(2,1));

F_versicolor=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_versicolor,pooled_sigma);
F_virginica=mvnpdf(X([idx_versicolor_test;idx_virginica_test],:),...
    mean_virginica,pooled_sigma);

[F_versicolor,F_virginica]
pred_data=(F_versicolor>F_virginica)
errors = (pred_data == [1;1;1;1;1;0;0;0;0;0])









