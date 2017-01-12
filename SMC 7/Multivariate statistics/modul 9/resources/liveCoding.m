%% MSPR lecture IX, 26/X/15
%% UNSUPERVISED LEARNING
%% Sigmuling function for convolutional neural network
x = [-5:0.1:5];
y = 1.0/(1 + exp(-x));
plot(x,y)


%% Agglomerative clustering

load game_data_small.mat
scatter(X(:,1),X(:,2))

fid = fopen('iris.data.txt');
data = textscan(fid,'%f%f%f%f%s','delimiter',','); 
X=[data{1} data{2} data{3} data{4}];
species = data{5};
fclose(fid);

%perform agglomerative clustering
%take only 10 items of each species
%decide at which clustering distance to cut the clustering tree
selection = X([1:10 51:60 101:110],:);
l = linkage(selection);
dendrogram(l,30,'colorthreshold', 0.8)
r = cluster(l, 'cutoff', 0.2, 'criterion', 'distance');
dendrogram(r, 30)
%check the help cluster and how to define right cut-off threshold

%% K-means clustering
%(looking for the highest value for Variance-ratio criterion)

K = 10;
eva = evalclusters(X, 'kmeans', 'CalinskiHarabasz', 'Klist', [1:K]);
eva