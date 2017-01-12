clear 
close all
% load the classifier trained already with the digits data
tmp = load('/Users/hendrik/Library/Matlab/toolboxes/cnn0.83/cnet.mat');
cnet =   tmp.sinet;
maxI=100;
[I,labels,I_test,true_labs] = readMNIST(maxI);
iidx=1:maxI;
for i=iidx,
    % preprocessing of images (centering ect)
    im=preproc_image(I_test{i});
    % simulink applies the trained model 'cent' to the image im
    % image needs to be transposed
    % ou is the 10 dimensional output, including one neuron for 
    % each of the 10 digits
    [ou cnet]=sim(cnet,im');
    % include all outputs into an array 100 (images) x 10 (classes)
    out(i,:)=ou;
    % finding the neuron with maximal activation (= the class= found digit)
    [dumm mxidx]=max(out(i,:));
    % since neurons encode the digits in the order 0,1,2,3, 
    % the i-th neuron encondes digit i
    res(i)=mxidx-1;
end
    
confmat(true_labs,res')
wrongidx=find(true_labs~=res');
for i=wrongidx', 
    figure
    % map image into a value range [0 1]
    imdisp = abs(double(I_test{i})/255-1)';
    % turn vector into a 28x28 matrix
    imagesc(reshape(imdisp,28,28));  
    % grey colormap
    colormap([0:1/255:1;0:1/255:1;0:1/255:1]');
end

x=[-5:0.1:5]
y=1./(1+exp(-x))
plot(x,y)

cnet.CLayer{2}
cnet.SLayer{3}
%%
load game_data_small
figure
scatter(X(:,1), X(:,2))
for i=1:size(X,1),  
    scatter(X(i,1), X(i,2),'b'); hold on;
    plot_defaults
    text(X(i,1), X(i,2),sprintf('  %d',i),'FontSize',16);
end
plot_defaults;
title('Game Player Scatter Plot')
xlabel('Duration')
ylabel('Performance')
plot_defaults;
%%
l=linkage(X);
[H T order]=dendrogram(l)
plot_defaults
title('Agglomerative Clustering (Single Linkage) of Gamer Behaviour')
xlabel('Gamer Index');
ylabel('Distance between Clusters');
plot_defaults
cutoffthreshold = 2.5;

r = cluster(l,'cutoff',cutoffthreshold,'criterion','distance');
dendrogram(l,'colorthreshold',2.5)
scatter(X(:,1),X(:,2),[],r);
%%

data_path='/Users/hendrik/teach/courses/mspr/data/';
% get file identifier (start index) where 'irsis.data' starts in 
%memory
fid = fopen([data_path 'iris.data']);
% in each line, read   4 numbers and then a string separated by 
% a ',', read all the lines till the end returns a cell array of 5 
% components: 4 150 dim. double vectors  (data{1} - data{4})  
% and one 150 dim. cell array of strings (adata{5})
adata = textscan(fid,'%f%f%f%f%s','delimiter',',');
fclose(fid);

%%
% build a feature  matrix of data type 'double' 
% from the first 4 cells of data:
X=[adata{1} adata{2} adata{3} adata{4}];
% the labels (classes) are retrieved from the 5th cell of adata: 
% a string cell array
% species=adata{5};
X=X([1:10 51:60 101:110],:)

h=figure
l = linkage(X);
dendrogram(l,'colorthreshold',2.5)

%%
fid = fopen([data_path 'iris.data']);
% in each line, read   4 numbers and then a string separated by 
% a ',', read all the lines till the end returns a cell array of 5 
% components: 4 150 dim. double vectors  (data{1} - data{4})  
% and one 150 dim. cell array of strings (adata{5})
adata = textscan(fid,'%f%f%f%f%s','delimiter',',');
% close file
fclose(fid);
X=[adata{1} adata{2} adata{3} adata{4}];
%load game_data
eva = evalclusters(X,'kmeans','CalinskiHarabasz','KList',[1:10])