%   dataRed.m
%   author:             Mattia Paterna
%   created:            February, 1st 2017
%   last edit:          February, 5th 2017
%
%   purpose:
%       analyze the set of MFCC coefficients for an incoming audio file and
%       apply:
%       1. intrinsic dimension estimation
%       2. dimension reduction in several strategies
%       3. compare the strategies
%
%       using the drtoolbox by van der Maaten
%       link: https://lvdmaaten.github.io/drtoolbox/

%%  0. preliminaries

%   load data to be reduced
load('forDataRed.mat');
if(exist('meas','var') == 0)
    warning('maes: variable not found. Data not loaded.');
end

%   add path for reduction toolbox
addpath('/Librerie/drtoolbox');

%   go to rdtoolbox directory
%   obs: may not work, set your own path
cd ../drtoolbox/techniques/

%   plot the original data space alone
gscatter(meas(:,1),meas(:,2),clusterStruct)
axis equal; grid on
title('Data space for the 100BPM half percussive sequence')

%%  1. intrinsic dimension estimation 
% no_dims = round(intrinsic_dim(meas));
% disp(['MLE estimate of intrinsic dimensionality: ',num2str(no_dims)]);

%   option: reducing to one-dimensional mapping
% no_dims = 2;
% if isequal(no_dims,1)
%     %   create a grouping variable for plotting
%     y = zeros(length(clusterStruct),1);
% end

%%  2. data reduction

switch exist('no_dims','var')
    %   if intrinsic dimension exists, use it
    case 1
        %   a. PCA
        [PCA_mappedX, PCA_mapping] = compute_mapping(meas, 'PCA', no_dims);
        if isequal(no_dims,1)
            PCA_mappedX = cat(2,PCA_mappedX,y);
        end
        figure;
        subplot(3,1,1);
        gscatter(PCA_mappedX(:,1), PCA_mappedX(:,2),clusterStruct); 
        title('Result of PCA reduction');  
        grid on; axis equal;

        %   b. t-SNE
        [tSNE_mappedX, tSNE_mapping] = compute_mapping(meas, 'tSNE', no_dims);
        subplot(3,1,2);
        if isequal(no_dims,1)
            tSNE_mappedX = cat(2,tSNE_mappedX,y);
        end
        gscatter(tSNE_mappedX(:,1), tSNE_mappedX(:,2),clusterStruct); 
        title('Result of t-SNE reduction');
        grid on; axis equal;
                
    %   otherwise, use default (= 2)    
    case 0
        %. PCA
        [PCA_mappedX, PCA_mapping] = compute_mapping(meas, 'PCA');
        figure;
        subplot(3,1,1);
        gscatter(PCA_mappedX(:,1), PCA_mappedX(:,2),clusterStruct); 
        title('Result of PCA reduction');
        grid on; axis equal;

        %   b. t-SNE
        [tSNE_mappedX, tSNE_mapping] = compute_mapping(meas, 'tSNE');
        subplot(3,1,2);
        gscatter(tSNE_mappedX(:,1), tSNE_mappedX(:,2),clusterStruct); 
        title('Result of t-SNE reduction');
        grid on; axis equal;
end

%   compare both mapping structures to the original data space
subplot(3,1,3)
gscatter(meas(:,1),meas(:,2),clusterStruct);
grid on; axis equal;
title('Original data structure using first 2 dimensions')


%   scatter only of t-SNE without labels
figure;
scatter(tSNE_mappedX(:,1), tSNE_mappedX(:,2),20,'MarkerFaceColor','b','LineWidth',0.75);
title('Result of t-SNE reduction in 2 dimensions')

%   gscatter using labels
figure;
gscatter(tSNE_mappedX(:,1), tSNE_mappedX(:,2),clusterStruct);
title('Result of t-SNE reduction in 2 dimensions')


%   go back to project folder
cd ../../smc8-semesterproject-audioconthdphmm/

%   save mappings in workspace
field1 = 'PCA';
field2 = 't_SNE';
loDimMap = struct(field1,PCA_mappedX,field2,tSNE_mappedX);
if exist('no_dims','var')
    save('loDimMap_intrinsic.mat');
else
    save('loDimMap_2D.mat');
end
 
%% eof