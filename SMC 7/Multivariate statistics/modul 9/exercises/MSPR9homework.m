%% MSPR9 homework
%% Exercise 2
%% Part A
load audiosegments.mat

% 4 different types of sound: bass, kick, snare, hi-hat
% therefore, number of cluster = 4

l = linkage(mfcc);
cutoff = 1.53; % minimum threshold value
[H,T,outperm] = dendrogram(l,'colorthreshold',cutoff);
set(H,'linewidth',2)

% for i=1:30
%      soundsc(sndseg{outperm(1,i)},sr)
%      pause
%  end


%% Part B
N = 5 % number of cluster found previously
E = evalclusters(mfcc,'linkage','CalinskiHarabasz','Klist',[1:N]);
fprintf('Optimal K = %d\n',E.OptimalK);

% The number of clusters given automatically coincides with the numbers of
% clusters shown in the cut dendrogram.

%% Part C
prpath = '/Librerie/prtools';
addpath(prpath);
prmfcc = prdataset(mfcc);

idx = kmeans(prmfcc,E.OptimalK);
figure('Name','K-means clustering');
scatter(prmfcc(:,1),prmfcc(:,2),[],idx);

%% Part D
r = cluster(l,'cutoff',cutoff,'criterion','distance');
figure('Name','Agglomerative clustering');
scatter(prmfcc(:,1),prmfcc(:,2),[],r);

% From the comparison it can be noticed how the agglomerative clustering
% returns only 4 cluster, while K-means clustering return 5. Moreover, the
% cluster separation is more coherent in agglomerative scatter plot - e.g.
% the three points in the left are divided in two different clusters in the
% agglomerative clustering, while in the K-means performance they are part
% of the same cluster even if the distance between each other is quite big.
% Finally, for the purpose agglomerative clustering seems to be the most
% suitable.
