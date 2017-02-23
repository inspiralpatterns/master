%   gmmBuild.m
%   author:             Mattia Paterna
%   created:            January, 15th 2017
%   last edit:          February, 9th 2017
%
%   purpose:
%       analyse the set of MFCC coefficients for an incoming audio file and
%       build a Gaussian mixture model that approximate the dataset. New
%       data are then synthesised to feed the HDP-HMM inference sampler.

%   strategy:
%       1. calculate the sample mean for each MFCC group, according to the
%       division given by the optimized cluster sequence;
%       2. build up a Gaussian distribution with unity covariance matrix;
%       3. synthetise data upon that;
%       4. run the inference sampler.

%   nb: the structure of ENST 039 audio file is taken as example. The
%   segmentation is based on the optimized cluster sequence given from
%   sampleFromNormal.m. The MFCC computation is based on mfccFit.m


%%  1. calculate the sample mean for each MFCC group
close all;
load('loDimMap_2D.mat');

%   define low-dimensionality dataset
meas = loDimMap.PCA;

%   define how many dimensions to take
noDim = 2;
mu = zeros(noClust, noDim);
Gmm = cell(3,1);

%   define the covariance matrix
type = 'fixed';
option = 'vivalamerda';

switch type
    case 'sample'
        sigma = zeros(noDim,noDim,noClust);
        fun = @(x) cov(x);
    case 'fixed'
        %   obs: diagonal unity matrix
        sigma = diag(ones(noDim,1));
        sigma = repmat(sigma,[1 1 noClust]);
    case 'pooled'
        %   calculate sample covariance for each group
        for n = 1:noClust
            tmpData = meas(find(clusterStruct == n),:);
            fun = @(x) cov(x);
            sigma(:,:,n) = fun(tmpData);
        end
        %   take the mean for each cluster
        pooledSigma = mean(sigma,3);
        sigma = repmat(pooledSigma,[1 1 noClust]);
end


for n = 1:noClust
    %   get data from the set and compute sample mean
    tmpData = meas(find(clusterStruct == n),:);
    mu(n,:) = mean(tmpData);
    
    %   compute sample covariance if needed
    if (strcmp(type,'sample') == 1)
        sigma(:,:,n) = fun(tmpData);
    end
    
    %   handle for the diagonal case
    if strcmp(option,'diagonal')
            sigma(:,:,n) = sigma(:,:,n) * eye;
     end
            
    %   build a mixture model, single component (proportion not specified)
    Gmm{n} = gmdistribution(mu(n,:),sigma(:,:,n));
    
    %   plot contour over scatter (at least bivariate)
    plotContour(tmpData,Gmm,n);
    
    pause;
end

%%  3. Synthetize data from the built normal distributions

close all;
synData = gmmSampling(clusterStruct,noDim,Gmm);

%   compare synthetic and original data
DataSum = cat(2,meas(:,1:2),synData);

%   plot both original and synthetic data
mode = 'separate';
plotEvents(loDimMap.PCA,synData,1,2,clusterStruct,mode);

%%  4. run the inference sampler

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
data_struct.obs         = synData';
data_struct.saveDir     = ['out/',foldername,'/'];
data_struct.saveName    = [inputfilename,'_',is_name];
data_struct.test_cases  = 1;
inputsettings.trial_vec = trial_vec;
data_struct.true_labels = clusterStruct;
data_struct.str_labs    = labels;

%   run the inference sampler
usinghdphmmtb(data_struct,inputsettings);

%%
% eof