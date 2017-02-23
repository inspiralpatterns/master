%   datasetFit.m
%   author:             Mattia Paterna
%   created:            January, 23rd 2017
%   last edit:          January, 24th 2017

%   purpose:
%       analyze the whole set of MFCC for several drum pieces, which has
%       been built using phrases played by drummer no. 2 in ENST data set
%       and fit a Gaussian mixture model to each drum piece.
%       OBS: labels are not necessary since each MFCC family has it own
%       cell matrix and clustering is not needed.

%   workflow:
%       1. fit a Gaussian Mixture Model to each MFCC set;
%       2. sample from each mixture, according to a provided structure
%       (e.g. a percussive audio loop made up of these events)
%       3. compare and evaluate synthetic data and MFCC extracted from the
%       provided structure

%   nb: the structure of ENST 039 audio file is taken as example. 

%%  1. fit a Gaussian Mixture Model to each MFCC set

load('dataset.mat');

%   join chh + ohh data
hh = [ohh; chh];

%   set no of clusters and components for each of it
noClust = 3;
noComp = [1 1 2];
labels = {'bd','sd','hh'};
noDim = 13;

Gmm = cell(noClust,1);

%   set seed for common start values (for reproducibility)
rng(1); 

for n = 1:noClust
    %   get correct data for each MFCC distribution
    switch labels{n}
        case 'bd'
            fprintf('fitting bass drum data\n')
            data = bd;
        case 'sd'
            fprintf('fitting snare drum data\n')
            data = sd;
        case 'hh'
            fprintf('fitting hi-hat data\n')
            data = hh;
    end
    
    %   convert data from cell to multidimensional double matrix
    len = length(data);
    data = cell2mat(data);
    data = reshape(data,[noDim,len])';
    
    %   check for linear independency
    %   todo: how to find which dimensions are linear dependent?
    r = rank(data);
    if (isequal(r, size(data,2)) == 0)
        warning('some columns in data could be linear dependent');
    end

    %   fit the mixture model
    regularizationValue = 1e-16;
    Gmm{n} = gmmFit(data, noComp(n),regularizationValue);
    
    %   plot scatter and contour for each MFCC group
    figure(n)
    if (~isequal(n,3) == 1)
        gscatter(data(:,1),data(:,2)); hold on
    else
        %   create grouping variable for ohh and chh
        hhGroups = cat(1,zeros(length(ohh),1),ones(length(chh),1));
        gscatter(data(:,1),data(:,2),hhGroups); hold on
    end
    
    %   get x and y axes within original data values
    x = min(data(:,1)):.1:max(data(:,1));
    y = min(data(:,2)):.1:max(data(:,2));
   
    %   get all combination of x, y
    [X,Y] = meshgrid(x,y);
    
    %   for each component inside the mixture, get mu and sigma and plot
    %   the contour in a two-dimensional space
    for i = 1:size(Gmm{n}.mu,1)
        
        %   get mu and Sigma - first two dimensions
        mu = Gmm{n}.mu(i,1:2);
        sigma = Gmm{n}.Sigma(1,1:2);
        
        %   if covariance shared, keep same sigma for all components
        if isequal(Gmm{n}.SharedCovariance,1) == 0
            sigma = Gmm{n}.Sigma(i,1:2);
        end
        
        %   compute the pdf evaluated at each observation, given mu and Sigma
        %   from the mixture model fitted to it
        Z = mvnpdf([X(:) Y(:)],mu,sigma);
        Z = reshape(Z,size(X));
        
        zmin = min(Z(:));
        zmax = max(Z(:));
        zinc = (zmax-zmin) / 10;
        zlevs = zmin:zinc:zmax;
        
        contour(X,Y,Z,zlevs); axis equal; grid on;
        hold on; 
        zindex = zmin:.05:zmax;
        contour(X,Y,Z,zindex,'LineWidth',2)
    end
    
end

clear data len mu sigma x y X Y;


%%  Plot the whole dataset and the contour on top of the data
D = cat(1,bd,sd,hh);
len = length(D);
D = cell2mat(D);
D = reshape(D,[noDim,len])';

%   create the grouping variable for the whole dataset
group = cat(1, zeros(length(bd),1), ones(length(sd),1),ones(length(hh),1)+1);

%   scatter plot of grouped data
figure
gscatter(D(:,1),D(:,2),group); axis equal; grid on;

%   plot each variables against the other
for n = 1:noDim
    %   nested loop
    for m = 1:noDim
        figure(n*m)
        gscatter(D(:,n),D(:,m),group); axis equal; grid on;
        xlabel(['Dimension ',num2str(n)]);
        ylabel(['Dimension ',num2str(m)]);
        title(['MFCC dataset using dimensions ',num2str(n),...
            ' and ',num2str(m)]);
    end
end


%%  3. compare and evaluate synthetic data and MFCC extracted
%   note: using featextraction code from SMC8 projects

%   load optimized cluster sequence and check for existence
load('sampleFromNormal.mat');
if(exist('timestamps','var') == 0)
    warning('timestamps: variable not found');
end
attacklen = 0.2;
featStruct = featureextractionsgmt(sgmts,fs,attacklen);

%%  Determination of number of clusters
%   (separated taks)

%   clustering data using a different number of clusters
[idx3,C3] = kmeans(D,3,'MaxIter',1000,'Replicates',10);
[idx4,C4] = kmeans(D,4,'MaxIter',1000,'Replicates',10);
[idx5,C5] = kmeans(D,5,'MaxIter',1000,'Replicates',10);

%   plot silhouette and take average value
[silh3,~] = silhouette(D,idx3);
[silh4,~] = silhouette(D,idx4);
[silh5,~] = silhouette(D,idx5);

xlabel 'Silhouette Value'
ylabel 'Cluster'

M3 = mean(silh3);
M4 = mean(silh4);
M5 = mean(silh5);
disp(max(cat(1,M3,M4,M5)));

%%  4. sample from the mixture, according to the original structure

DataFromFit = gmmSampling(clusterStruct,noDim,Gmm);

%%  5. run the HDP-HMM inference sampler

%   create a structure according to inference script input specifics
%   get date for the output struct name
inputfilename   = filename(10:end-4);
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

foldername              = [inputfilename(1:3),'_',is_name];
data_struct.obs         = meas(:,1:2)';
data_struct.saveDir     = ['out/',foldername,'/'];
data_struct.saveName    = [inputfilename(1:3),'_',is_name];
data_struct.test_cases  = 1;
inputsettings.trial_vec = trial_vec;
data_struct.true_labels = clusterStruct;
data_struct.str_labs    = labels;

%   run the inference sampler
usinghdphmmtb(data_struct,inputsettings);

%% eof