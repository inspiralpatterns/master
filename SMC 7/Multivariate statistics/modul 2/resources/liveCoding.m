%% Define the belongness of a point to a certain class
%we have to compute the Euclidean distance for x from each point
%belonging to their class; the minimum distance means the point
%belongs to the class which the point involved is in.

x = [1;3;2]; %the point
a1 = [0;1;0]; a2 = [2;4;2]; %points for each class

%calculate the Euclidean distance
%case 1
z1 = sqrt(sum((x-a1).^2));
%case 2
z2 = sqrt((x-a1)' * (x-a1));
%case 3
z3 = norm(x-a1);
z4 = norm(x-a2);

%% Matrix Multiplication
%we can think of a mix as a multiplication by a matrix that 
%contains the tracks and another matrix that contains all 
%the amplitude coefficients

[bass sr] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/bass.wav');
[vox sr] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture I/homework/vox.wav');

amp = [0.1 0.9; 0.9 0.1];
mix = [vox bass];
R = mix*amp;

sound(R,sr);


%% Inverse matrices (only on square ones)
A = [2 4 5; 1 3 -1; 1 -3 5];
B = [2 4 6; 1 0 -1; -1 -2 -3];
b = [1; 2; 3];

rA = rank(A);
rB = rank(B);

%A is invertible but B is not
%B is called singular or degenerate matrix
Ai = inv(A)
I = A * inv(A) %identity

% Ax = b
%x = A^(-1) * b
x = inv(A) * b

%% Exercises slide 40
%% Exercise 1
clear;
A = [1 5; 2 3];
B = [0 2; 0 1];
C = [3 1; 0 0];

S = A*(B+C);

%% Exercise 2


%% Exercise 3
A = [1 -1; 1 1];
B = [1/2 1/2; -(1/2) 1/2];

%A is the inverse of B is multiplying them we obtain I
%that is the unity matrix

I = A*B










