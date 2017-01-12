%% MSPR IV 28/09/15
%% Eigenvalues adn eigenvectors
A=[2 1;1 2];
[V D] = eig(A)

% eigenvalues can have different number as they remain in the same
% direction or are lied on the same line.

%% orthonormal matrix
v1 = [1; 1];
v2 = [1; -1];
v1'*v2
% its inner product is zero
% the inverse matrix is equal to the transposed one: inv(A)=A'

%% eigenvalues decomposition
% (application on symmetric matrices, e.g. covariance and correlation)

%% class assignment I
A = [0 1;1 0];
[V, D] = eig(A);

eigv = diag(D); %create the vector of eigenvalues
[eigv,idx] = sort(eigv, 'descend'); %sorts the elements in descending order
eigv = eigv(idx); %shows the sorted matrix

V
V = V(:,idx) %rearranging the eigenvectors matrix

%% class assignment II
clear;
clc;
fid = fopen('iris.data.txt');
data = textscan(fid, '%f%f%f%f%s',...
    'delimiter', ',');
fclose(fid);

DATA = [data{1} data{2} data{3} data{4}];
C = cov(DATA);

[V,D] = eig(C);
eigv = diag(D);
[eigv,I] = sort(eigv, 'descend');
V = V(:,I);

plot(eigv);
set(gca, 'XTick', [1 2 3 4], 'XTickLabel', {'1.','2.','3.','4.'});

%display the eigenvectors over the 4 features
plot(V(:,1), 'r'); hold on;
plot(V(:,2), 'b:'); hold on;
plot(V(:,3), 'g-'); hold on;
plot(V(:,4), 'k*-'); hold on;


%% class assignment III
xmean = mean(DATA);
tmp = ones(size(DATA,1), 1);
M = tmp*xmean;

CDATA = DATA - M; %data centering
V2 = [V(:,1:2)]; %matrix of two highest eigenvectors
scores = CDATA*V2; %projection on eigenvectors
species = data{5};

z = prdataset(scores, species, 'featlab',...
    ['Score on 1.Eigenvector'; 'Score on 2.Eigenvector'], 'name', 'PCA Projection of Iris Data on Eigenvectors');
figure(1); scatterd(z);
