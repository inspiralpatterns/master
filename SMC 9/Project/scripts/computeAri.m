%   computeAri.m
%   author:         Mattia Paterna
%   created:        February, 9th 2017
%   last edit:      February, 10th 2017
%
%
%   purpose:
%       calculate the Adjusted Rand Index on the most three repeated seqs,
%       which are the outcomes of the HDP-HMM inference process. The
%       original cluster structure has been created using several
%       constraints
%   
%
%%  0. load variables needed
addpath(genpath('out'));
close all;
clear;

%   set the path for the workspaces to be selected
path = 'out/138BPM_simple_PCA';

%   load optimized cluster sequence and check for existence
load('/toAnalyse/138BPM_simple_beats.mat','clusterStruct');
if(exist('clusterStruct','var') == 0)
    warning('timestamps: variable not found');
end

%%  1. get the state sequences for all the iterations

%   load the specific workspace to work
cd(path);

%   get files from the specific path
filesfolds  = dir(pwd);                                             
filesfolds  = filesfolds(~([filesfolds.isdir]));  

%   create a logical array
toFetch = false(length(filesfolds),1);

%   create an array to collect all the hdphmm state sequences
hdpStruct = zeros(0,0);

%   when we have iterations to fetch, set the array to true
for n = 1:length(filesfolds)
    if ~isempty(strfind(filesfolds(n).name,'trial01'))
        toFetch(n) = true;
        
        %   for each true, load and fetch the state sequences 
        load(filesfolds(n).name,'S');
        
        %   check if variable has been loaded
        if ~exist('S','var')
            warning('no state sequence structure loaded')
        end
        
        %   extract the state sequences
        dimu = length(S.stateSeq);
        for nn = 1:dimu
            hdpStruct = cat(1,hdpStruct,S.stateSeq(nn).z);
        end
    end
end

%   delete the burnout stage
hdpStruct(1:200,:) = [];

%   check for the correct number of iterations
if ~isequal(length(hdpStruct),1000)
    warning('incorrect iterations number')
end

%   get back to main directory and make some cleaning
cd ../..;
clear S filesfolds dimu toFetch nn;
%%  2. compare the state sequences and keep track of their frequencies
%   strategy:
%       1. take a sequence and compare it to all the others
%       2. get its frequency
%       3. delete all its instances from hdpStruct
%       4. repeat until all the sequences have been tested

%   create an array where to store unique sequences
stateSeqs = zeros(0,0);
%   create an array for frequency tracking
freqs = zeros(0,0);
%   initialize the counter
i = 1;

while (~isequal(size(hdpStruct,1),0))
    %   set an array of logical false
    match = false(size(hdpStruct,1),1);
    
    %   compare always the first struct and fill the match logical array
    for n = 1:size(hdpStruct,1)
        if isequal(hdpStruct(1,:),hdpStruct(n,:))
            match(n) = true;
        end
    end
    
    %   get the frequency and save the corresponding sequence
    idx = find(match == true);
    freqs = cat(1,freqs,length(idx));
    stateSeqs = cat(1,stateSeqs,hdpStruct(1,:));
    
    %   delete the matched state sequences
    hdpStruct(idx,:) = [];
    
    %   update the counter
    i = i + 1;
end

%%  3. ARI measure on three most repeated sequences

%   store both AR and RI
field = {'hdpStruct','AR','RI','freq'};
results = struct(field{1},zeros(3,length(clusterStruct)),...
                 field{2},zeros(3,1),...
                 field{3},zeros(3,1),...
                 field{4},zeros(3,1)...
                 );

for n = 1:3
    %   get the most repeated sequence
    idx = find(freqs == max(freqs));
    %   get the number of occurrencies
    results.freq(n) = max(freqs);
    %   compute the ARI for the state sequences
    if length(idx) > 1
        idx = idx(1);
    end
    [AR,RI] = RandIndex(stateSeqs(idx,:),clusterStruct);
    %   save sequence and result
    results.hdpStruct(n,:) = stateSeqs(idx,:);
    results.AR(n) = AR;
    results.RI(n) = RI;
    
    %   delete structure and frequency
    stateSeqs(idx,:) = [];
    freqs(idx) = [];
end

%   save the variable 
cd results;
type = 'simple_beats_PCA';
workspace = strcat(path(5:7),'_',type,'.mat');
save(workspace,'results');
cd ..;

%% eof        
