%% MSPR 3 homework
%% Exercise 2

load cloud.mat

% projection onto the x-y plane
XY = [1 0 0; 0 1 0; 0 0 0];
Pxy = XY * X;

% projection onto the y-z plane
YZ = [0 0 0; 0 1 0; 0 0 1];
Pyz = YZ * X;

% projection onto the subplane spanned by a+b
a = [1; 1; 0];
b = [0; 1; 1];
A = [a b];

P = A*inv(A'*A)*A';
size(P);
% since P has size 3x3 we can multiply it with X
Pp = P * X;

t1 = sum(norm(Pxy).^2)/sum(norm(X).^2);
t2 = sum(norm(Pyz).^2)/sum(norm(X).^2);
t3 = sum(norm(Pp).^2)/sum(norm(X).^2);

% the third projection onto the plane spanned by a+b vectors is the better
% one because it reflects the spreadness of the original data set (t3 is
% the closest to 1)

%% Exercise 3

A = [3/2 -1/2; -1/2 3/2];
[V,D] = eig(A);
% the columns of V are the corresponding right eigenvectors, so that A * V =
% V * D
% the diagonal matrix D contains the eigenvalues

%% Exercise 4

% generate the grid of x values
x = -10:0.5:10;

% generate the matrix and fill the rows with different functions of x
X = x;
X(2,:) = x;
X(3,:) = -x;
X(4,:) = x.^2;
X(5,:) = sin(x);
X(6,:) = rand(1, size(x,2));

% plot all the functions
figure;
plot(X(2,:), 'b'); hold on;
plot(X(3,:), 'r'); hold on;
plot(X(4,:), 'g'); hold on;
plot(X(5,:), 'm'); hold on;
plot(X(6,:), 'k'); hold on;

%Pearson correlation coefficients
r = corr(X')
% as shown in the Pearson correlation table, the first two functions have a
% strong correlation owing to they are the same one. However, the third one
% has an inverse correlation since the function gives clearly opposite
% values. There's no correlation between f(x) = x^2 and the all the
% other ones and a weak correlation between f(x) = sin(x) and the all the
% other ones. We finally can notice how there's a weak and changing
% correlation for the last function and that's due to the randomic nature
% of that one.


%% Exercise 5

fid = fopen('adult.data.txt');
data = textscan(fid, '%f%s%f%s%f%s%s%s%s%s%f%f%f%s%s',...
    'delimiter', ',');
fclose(fid);


% convert categorical variables into numerical ones
s1 = 'Male';
s2 = '>50K';
data{10} = strcmp(data{10}, s1);
data{15} = strcmp(data{15}, s2);

X = [data{1}, data{5}, data{10}, data{11}, data{12}, data{13}, data{15}];

%% 5a
% correlation over the 7 features

r = corr(X)

% discussion: in order to predict the income the second function is the
% best suited since it has the higher correlation value for the income
% function.










