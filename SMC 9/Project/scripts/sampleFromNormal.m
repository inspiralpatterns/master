%%  sampleFromNormal.m
%
%   how it works:
%       sample from different multivariate normal distribution. The
%       different normal distributions represent different clusters in which
%       audio events could be grouped.

%   purpose: 
%       create a perfect data representation to find out whether
%       hdp-hmm inference works better or not if data is not biased by a 
%       bad homogenisation process.

%   nb: the structure of ENST 039 audio file is taken as example.

%%  0.  preliminaries
addpath(genpath('../smc8-semesterproject-hdphmm'));
addpath(genpath('../lightspeed'));
set(0, 'DefaulttextInterpreter', 'none')

%%  1. load annotation file
name = 'test39.jnt';
fid = fopen(name);
data = textscan(fid, '%f %s');
timestamps = data{1};               % store timestamps
labStruct = data{2};                % store the original label structure
fclose(fid);
clear data fid;

%%  2. score-like representation and labels pre-processing

%   for case test59: discard initial fill
if isempty(setdiff(name(5:6), '59'))
    timestamps = timestamps(9:end);
    labStruct = labStruct(9:end);
end

%   generate cluster representation
[clusterStruct,labels,~] = createClusterstruct(labStruct);
threshold = floor(length(clusterStruct)*0.15);

%   get time difference from consecutive onsets and discard if under a
%   adaptive threshold (i.e. half the average pulse time)
interbeat = diff(timestamps);  
toExclude = find(interbeat < mean(interbeat)/2 + mean(interbeat)/4);
for i = 1: length(toExclude)
    timestamps(toExclude(i)+1) = 0;
    clusterStruct(toExclude(i)+1) = 0;
    %labStruct{toExclude(i)+1} = 0;
end

%   delete all zeros
clusterStruct(clusterStruct == 0) = [];
timestamps(timestamps == 0) = [];
% for i = 1:length(labStruct)
%     %   check when a cell is null
%     if (isequal(labStruct{i},0) == 1)
%         %   delete that cell entry from the cell array
%         labStruct(i) = [];
%     end
% end

%   check if duple subdivision is maintained (last onset discarded)
if (mod(length(clusterStruct)-1,2) ~= 0)
    warning('Duple subdivision not respected!');
end

%   labels substition if under the threshold (duple tempo assumed)
%   save original optimized cluster sequence (used in gmmBuild to get the
%   mixing proportion for the gmm)
clusterStructOld = clusterStruct;

noClust = length(unique(clusterStruct));
for i = 1:noClust
    noEvents = length(find(clusterStruct == i));
    if (noEvents < threshold)
        %   take the labels from previous bar, same pulse
        events = find(clusterStruct == i);
        for i = 1: length(events)
            previousPos = events(i) - 4;
            if previousPos > 0
                clusterStruct(events(i)) = clusterStruct(previousPos);
            else
                %   take the labels from successive bar, same pulse
                nextPos = events(i) + 4;
                clusterStruct(events(i)) = clusterStruct(nextPos);
            end
        end
    end
    
end

clear threshold interbeat toExclude noEvents previousPos events;

%%  3. define n 2-D normal distributions, when n = length(labels)

%   create a struct for both MUs and SIGMAs
noClust = length(unique(clusterStruct));
mndParams = struct('mu', zeros(2, noClust), 'sigma', cell(1));

%   fill the structure with values
%   (simple case, for n = 2 and diagonal covariance matrix)
%   how: means are consecutive and equally spaced, while variances are
%   quite small, so that they are not overlapped
for i = 1: noClust
    mndParams.mu(:, i) = [(i*2-1); (i*2-1)];
    mndParams.sigma{i} = [0.5 0; 0 0.5];
end

%   save labels for the optimal structure (to be used in mfccFit.m to get
%   the number of components for each mixture)
mainLabels = unique(clusterStruct);

%   rescale clusterStruct according to the overall number of clusters
clusters = unique(clusterStruct);
for i = 1:length(clusters)
    %   get indexes for a specific group
    clusterIdx = clusterStruct == clusters(i);
    %   substitute with i
    clusterStruct(clusterIdx) = i;
end

clear clusterIdx clusters;

%%  4. draws from the opportune normal distribution, according to clustStruct
%   nb: each draw is a vector of coordinate in the 2-D distribution

%   create a m-by-n matrix to store draws
%   n: number of audio events
%   m: number of coefficient for each event (fixed to 2 to sample MFCCs)
AData = zeros(2, length(clusterStruct));

for i = 1:length(AData)
    currentClust = clusterStruct(i);
    % call mu and sigma for structures
    mu = mndParams.mu(:, currentClust);
    sigma = mndParams.sigma{currentClust};
    % sample from normal distribution
    AData(:, i) = mvnrnd(mu, sigma);
end

clear mu sigma currentClust i k;

%   save for gmm fitting (see mfccFit.m script)
save('sampleFromNormal.mat');

%%  5. create a structure according to inference script input specifics
%   get date for the output struct name
inputfilename   = '039_phrase_disco_simple_medium_sticks';
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
data_struct.obs         = AData;
data_struct.saveDir     = ['out/',foldername,'/'];
data_struct.saveName    = [inputfilename(1:3),'_',is_name];
data_struct.test_cases  = 1;
inputsettings.trial_vec = trial_vec;
data_struct.true_labels = clusterStruct;
data_struct.str_labs    = labels;

%   run the inference sampler
usinghdphmmtb(data_struct,inputsettings);
 
%% eof