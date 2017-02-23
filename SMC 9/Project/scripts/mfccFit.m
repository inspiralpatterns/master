%   mfccFit.m
%   author:             Mattia Paterna
%   created:            January, 12th 2017
%   last edit:          January, 20th 2017
%
%   purpose:
%       analyze the set of MFCC coefficients for an incoming audio file and
%       fit that data with normal distribution. A new set of data is then
%       sampled from the fitted distribution.

%   strategy:
%       1. use original timestamps to divide the input audio file;
%       2. get MFCCs for each segment;
%       3. fit a Gaussian Mixture Model to each label data;
%       4. sample from each mixture, according to the original structure
%       5. run the HDP-HMM inference sampler

%   nb: the structure of ENST 039 audio file is taken as example. The
%   segmentation is based on the optimized cluster sequence given from
%   sampleFromNormal.m.

%%  1. use original timestamps to divide the input audio file
close all;
clear;

filename = '/data set/beats/138BPM_simple.wav';
%   load audiofile
[snd, fs] = audioread(filename);
%   load optimized cluster sequence and check for existence
load('/toAnalyse/138BPM_simple_beats.mat');
if(exist('timestamps','var') == 0)
    warning('timestamps: variable not found');
end

if(exist('tempi','var'))
    clear tempi;
end

%   create structure for segments
sgmts = segmentsnd(snd, fs, timestamps);


%%  2. get MFCCs for each segment
%   note: using featextraction code from SMC8 projects

attacklen = 0.2;
featStruct = featureextractionsgmt(sgmts,fs,attacklen);

%%  3. fit a Gaussian Mixture Model for each label 
%   note: the number of components of each mixture is inherited from the
%   original annotations. That procedure has not been abstracted yet and is
%   based on the assumption that, for simple audio files, all the possible
%   combinations of drum pieces could be limited to BD, SD, and HH as large
%   families.

%%  3.1 Preliminaries
%   convert cell structure into a matrix of floating point values
mfccDim = length(featStruct.sgmt_mfccs{1});
meas = zeros(length(timestamps), mfccDim);
for i = 1:length(timestamps)
    meas(i,:) = featStruct.sgmt_mfccs{i};
end

%   save for gmmBuild.m
save('gmmBuild.mat');
%   -> go to build a mixture model


%   check for good conversion
if (isequal(i, length(timestamps)) == 0)
    warning('loop counter has not reached the end of data structure');
end

%   check for linear independency
%   todo: how to find which dimensions are linear dependent?
r = rank(meas);
if (isequal(r, size(meas,2)) == 0)
    warning('some columns in data could be linear dependent');
end

clear r mfccDim attacklen;

%   set seed for common start values (for reproducibility)
rng(1); 

%   save variables for data reduction stage
save('forDataRed.mat')
%   -> go for dimensionality reduction
dataRed

%%  3.2 Define the number of components for each label
%   strategy: determine if main label is in string

%   supervised version (skipped)

if ~exist('noClust','var')
    noClust = 3;
end

noComponents = zeros(noClust,1);
mainLabels = {'bd';'sd';'hh'};
idx = zeros(length(labels),1);

%   check in case noClust is not 3
if (isequal(length(mainLabels), noClust) == 0)
    warning('main labels do not correspond to the number of clusters');
end

%   for each main labels, find all the original labels containing it and
%   get a (hypothetical) number of components for that.
for n = 1:length(mainLabels)
    k = strfind(labels,mainLabels{n});
    
    %   exclusive disjunction implemented
    if (n == 3) && (isempty(k) == 0)
        noComponents(n) = length(labels) - sum(noComponents(1:n-1));
        break;
    end
    
    for i = 1:length(k)
        %   handle special case for snare drum
        if (isempty(strfind(labels{i},'sd')) == 0) && (isequal(idx(i),1) == 0)
            noComponents(2) = noComponents(2) + 1;
            idx(i) = 1;
        end
        if (isempty(k{i}) == 0)
            %   check if the original label corresponds to another main label
            %   (if so, corresponding boolean is true)  
            if (isequal(idx(i),1) == 0)
                idx(i) = 1;
                noComponents(n) = noComponents(n) + 1;
            end
        end
    end
end

clear k idx;


%   define number of dimensions to be taken
%   to do: which kind of data reduction? maybe separate script.
noDim = 2;


%%  Determination of number of clusters
%   (separated taks)
close all;

%   A. for the whole dataset
%   use low-dimensional mapping for cluster evaluation
type = 'null';
if strcmp(type,'low')
    meas = loDimMap.t_SNE;
end

%   use Variance-Ratio criterion to get the the optimal number of clusters
%   and the optimal cluster structure
[optimalStruct,bestClustNo] = clusterDet(meas,5);

%   compare it visually to the original
figure;
axis equal; grid on;
subplot(2,1,1);
gscatter(meas(:,1),meas(:,2),clusterStruct,'rgb');
title('Original structure')
subplot(2,1,2);
gscatter(meas(:,1),meas(:,2),optimalStruct);
title('Optimal structure using cluster evaluation')

%   train the k-means clustering algorithm using the optimal number of
%   cluster
[idx,C] = kmeans(meas,bestClustNo,'MaxIter',1000,'Replicates',10);
figure;
gscatter(meas(:,1),meas(:,2),idx); 
axis equal; grid on; hold on;
plot(C(:,1),C(:,2),'kx','MarkerSize',13,'LineWidth',2);
legend('Cluster 1','Cluster 2','Cluster 3','Centroids',...
       'Location','SW')
title 'Cluster Assignments and Centroids'


%   B. for the single label group
%   obs: assuming not more than 5 clusters per group
groupClustNo = zeros(length(labels),1);
for n = 1:length(labels)
    
    %   get observation for each group
    data = meas(clusterStruct == n,:);
    
    %   perform evaluation
    [~,groupClustNo(n)] = clusterDet(data,5);
    
    %   train the k-means clustering algorithm using
    [idx,C] = kmeans(data,groupClustNo(n),...
        'MaxIter',1000,'Replicates',10);
    figure(n+2);
    gscatter(data(:,1),data(:,2),idx);
    axis equal; grid on; hold on;
    plot(C(:,1),C(:,2),'kx','MarkerSize',13,'LineWidth',2);
    legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Cluster 5',...
        'Centroids','Location','SW')
    title 'Cluster Assignments and Centroids'
    hold off;
    
%    pause;
end


%%  3.3 Fit a Gaussian mixture model for each label
%   in case an exception is thrown, use fitting with regularization scalar

%   obs: uses t-SNE low dimensionality mapping
load('loDimMap_2D.mat');
if ~exist('loDimMap','var')
    warning('Low-dimensionality mapping not found')
end

Gmm = cell(noClust,1);

for n = 1:noClust
    switch n
        case 1
            fprintf('fitting bass drum data\n')
        case 2
            fprintf('fitting hi-hat data\n')
        case 3
            fprintf('fitting snare drum data\n')
    end
    
    %   get original data for each label
    idx = find(clusterStruct == n);
    data = loDimMap.PCA(idx,:);
    
    %   check if data is correct
    %   assumption: if the events are under the same label, their index
    %   difference should be multiple of 2
    intervals = diff(idx);
    isMultiple = mod(intervals,2);
    % obs: take sum, otherwise 4 logical will never be equal to an integer
    if (isequal(sum(isMultiple),0) == 0)
        warning('warning: there may be wrong events inside this label')
    end
    
    %   use gmmFit function according to the label to be fitted
    regularizationValue = 1e-16;
    Gmm{n} = gmmFit(data, groupClustNo(n),regularizationValue);
    
    %   plot scatter and contour for each label
    plotContour(data,Gmm,n);
    pause;
end

clear interval isMultiple idx data;

%%  4. sample from the mixture, according to the original structure

DataFromFit = gmmSampling(clusterStruct,2,Gmm);

%%  Model evaluation

%   create a matrix containing original data and sample from mixture
DataSum = cat(2,loDimMap.t_SNE,DataFromFit);

%   plot both original and synthetic data
mode = 'separate';
plotEvents(loDimMap.PCA,DataFromFit,1,2,clusterStruct,mode);

%%  5. run the HDP-HMM inference sampler
close all;

%   create a structure according to inference script input specifics
%   get date for the output struct name
inputfilename   = filename(16:end-4);
trial_vec       = 1;
t = char(datetime('now','TimeZone','local','Format','yyMMdd_HHmm_'));

inputsettings.Kz      = 10;
inputsettings.Ks      = 1;
inputsettings.a_alpha = 3;
inputsettings.b_alpha = 1.5;
inputsettings.a_gamma = 3;
inputsettings.b_gamma = 1.5;

is_name = sprintf('Kz%i_Ks%i_alpha%0.2f_gamma%0.2f',inputsettings.Kz,...
    inputsettings.Ks,inputsettings.a_alpha,inputsettings.a_gamma);
fprintf(sprintf('\n%s',is_name))

foldername              = [inputfilename,'_',is_name];
data_struct.obs         = loDimMap.PCA';
data_struct.saveDir     = ['out/',foldername,'/'];
data_struct.saveName    = [inputfilename,'_',  is_name];
data_struct.test_cases  = 1;
inputsettings.trial_vec = trial_vec;
data_struct.true_labels = clusterStruct;
data_struct.str_labs    = labels;

%   run the inference sampler
usinghdphmmtb(data_struct,inputsettings);

%% eof