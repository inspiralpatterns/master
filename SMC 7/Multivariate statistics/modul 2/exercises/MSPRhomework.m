%% MSPR Homework lecture II
%% Exercise 2

A = [-1 5 -1; 5 0 5; -1 5 -1];

d = isdiag(A);
%because the entries outside the diagonal are not zero, the matrix is not a diagonal one

r = rank(A);
size(A);
%r = 2, the matrix is not invertible because r < size(A)

s = A';
%the matrix is a simmetric one

%% Exercise 4
clear;
clc;

u = [-0.6; 0.8];
v = [3; 4];
w = [8; 6];

%calculation
u * v'
u * w'
u * (v+w)'
w * v'

%length of the vectors
n1 = norm(u)
n2 = norm(v)
n3 = norm(w)

%unit vectors in the directions of v and w
%for v:
unitv = v / n2
%for w:
unitw = w / n3


%% Exercise 5
clear;
clc;

a1 = [0.4; 0; 0; 0.6; 0];
a2 = [0; 0.5; 0; 0; 0.5];
a3 = [0; 0.5; 0.5; 0; 0];
a4 = [0; 0; 0.2; 0.8; 0];
a5 = [0; 0; 0.5; 0; 0.5];

A = [a1, a2, a3, a4, a5];
r = rank(A);
%A is invertible

Ainv = inv(A);

[mix1, sr1] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture II/homework/mix1_snare_kick.wav');
[mix2, sr2] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture II/homework/mix2_gtr_vox.wav');
[mix3, sr3] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture II/homework/mix3_gtr_bass.wav');
[mix4, sr4] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture II/homework/mix4_bass_kick.wav');
[mix5, sr5] = audioread('/SMC/Multivariate Statistics and Pattern Recognition/Lecture II/homework/mix5_bass_vox.wav');

M = [mix1, mix2, mix3, mix4, mix5];

R = M * Ainv;

sound(R(:, 1), sr1); pause(2);
sound(R(:, 2), sr2); pause(2);
sound(R(:, 3), sr3); pause(2);
sound(R(:, 4), sr4); pause(2);
sound(R(:, 5), sr5); pause(2);

%If we use less or more than 5 mixtures we are not be able to obtain an invertible matrix so we can't retrive original sound track.
%Hovewer, changing the mixing coefficients and inverting the resultant new
%matrix it is possible to obtain different retrievals.


%% Exercise 5 - proposed solution

chann = {'snare', 'gtr', 'bass', 'kick', 'vox'};
mixlabels = {'snare_kick', 'gtr_vox', 'gtr_bass', 'bass_kick', 'bass_vox'};
A = [0.4 0.0 0.0 0 0;
    0.0 0.5 0.5 0 0;
    0.0 0.0 0.5 0.2 0.5;
    0.6 0.0 0.0 0.8 0;
    0.0 0.5 0.0 0 0.5];

for i = 1:length(chann),
    [remix(:,i), sr] = audioread(sprintf('mix%i_%s.wav', i, mixlabels{i}));
end

for i = 1:length(chann),
    sound

%% Exercise 6

%ex 2: yes
%ex 4: yes
%ex 5: yes

