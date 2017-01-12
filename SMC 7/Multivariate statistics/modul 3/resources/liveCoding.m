%% Class assignment
%% Exercise 1
% The small vector spaces that contains P and L could be one of these
% possibilities:
% a) the R3 vector space;
% b) the plane defined by P that contains also L;
%% Exercise 2

v1 = [1, 1, -1];
v2 = [-1, -1, 1];

figure(1);
plot3(1, 1, -1, -1, -1, 1, 'r');

% a) the line that contains both the vectors - vectors v2 is c * v1 where c = -1 is a scalar;
% b) hte plane in R3;
% c + d) the whole  R3 tridimensional space;

%% VARIANCE, COVARIANCE, CORRELATION
%% Class assignment

% Sample means of the features
fid = fopen('iris.data.txt');
data = textscan(fid, '%f%f%f%f%s', 'delimiter', ',');
fclose(fid);

% it is possible to compute the mean over the whole matrix avoiding
% unuseful command repetition
X = [data{1} data{2} data{3} data{4}];
[I, J] = size(X);
M = mean(X);

% Sample variances and sample stardard deviations
V = var(X);
D = std(X);

% how to center the data, so that data points group around the origin (0),
% using matrix multiplication?
% Basically, we do subtract the columns means to each element of the
% respective colums. To do this using matrix operations we can create a
% unity matrix: 

U = ones(size(X,1),1);
Xc = X - (U * M);
U = U * M;
Mc = mean(Xc);

%% Class assignment
% variance using matrix multiplication

Xv = (Xc(:,J)'* Xc(:,J))/(I-1);

% covariance using matrix multiplication

C = Xc'*Xc/(I-1);
cov(X); %matlab formula for covariance

% correlation
r = C(4,1)/(std(X(:,1))*std(X(:,4)));
corr(X); %matlab formula for correlation


%% PROJECTION
%% Class assignment

a = [-2; 3; 2];

% projection onto xz plane
xz = [1 0 0; 0 0 0; 0 0 1];
p1 = xz * a;

% projection onto y
y = [0 0 0; 0 1 0; 0 0 0];
p2 = y * a;

% projection onto yz plane
yz = [0 0 0; 0 1 0; 0 0 1];
p3 = yz * a;

%% Class assignment
A = [1 0; 1 1; 1 2];
b = [6 0 0];

P = A*inv(A'*A)*A';


%% EIGENVALUES AND EIGENVECTORS
%% Class assignment


A = [0 1;1 0];
[V D] = eig(A);







