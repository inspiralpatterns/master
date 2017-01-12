%% MSPR4 homework
%% Exercise 1

%import adult dataset
fid = fopen('adult.data.txt');
data = textscan(fid, '%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s',...
    'delimiter', ',');
fclose(fid);

%convert categorical variables 'sex' into numerical one
s1 = 'Male';
data{10} = strcmp(data{10}, s1);


X = [data{1}, data{5}, data{10}, data{11}, data{12}, data{13}];

%% part A
S = cov(X);
[V,D] = eig(S);

eigval = diag(D);
cs = cumsum(eigval)/sum(eigval);%cumulant relative eigenvalues
figure;
plot(cs);
set(gca, 'XTick', [1 2 3 4 5 6], 'XTickLabel', {'1.','2.','3.','4.', '5.','6.'});


[s_eigval, I] = sort(eigval, 'descend');
s_V = V(:,I);

p1 = s_eigval(2)/sum(s_eigval)
p2 = s_eigval(1)/sum(s_eigval)
%the percentage of the variance explained by the second highest eigenvector
%p1 is 0.003%.
%from the plot, it can be noticed how only the last two eigenvectors are
%important to represent the data. That's because their eigenvalues cover almost all the
%percentage of the variance and that means the data are spread mostly in
%their directions - p1+p2 = 1


%% part B
s_V(:,1)
%the features which the highest eigenvalues is related with are:
%capital-gain;


%% part C
L = size(X,1);
Xc = X - ones(L,1)*mean(X); %centered dataset
scores = Xc * V(:,6);%scores on the highest eigenvector
Xr = scores * V(:,6)' + ones(L,1)*mean(X);

%plotting capital-gain vs age
figure; 
scatter(data{11}, data{1}); hold on
scatter(Xr(:,4), Xr(:,1), 'r');


%% part D
%variance over each feature
variances = var(X)

%as we can see from the plot, the reconstructed dataset(made of red points)
%is not such succesful because doesn't preserve the original distribution.


%eigenvalue decomposition on the correlation matrix
R = corr(X);
Cr = cov(R);
[Vr, Dr] = eig(Cr);
r_eigval = diag(Dr);
r_cs = cumsum(r_eigval)/sum(r_eigval);
figure;
plot(r_cs);
set(gca, 'XTick', [1 2 3 4 5 6], 'XTickLabel', {'1.','2.','3.','4.','5.', '6.'});

%an eigenvalue matrix over the correlation matrix could display more
%significant values due to its eigenvectors seem more related to all the
%features.