%   createStruct.m
%   author:             Mattia Paterna
%   created:            January, 24th 2017
%   last edit:          February, 9th 2017

%   purpose:
%       create an optimal structure representation for a percussive audio
%       file, that will be used later to assess how well the HDP-HMM
%       statisical model can represent a musical time series.

%   workflow:
%       1. load the onsets and the beat/tempo annotations
%       2. find similarities and select onsets that lie on a metrical
%       position, discarding the others
%       (alternative: a binary tree could represent a metrical structure in
%       its subdivision, down along the three)
%       3. create a label struct for the optimal onset selection
%       4. export a .csv file to use as layer in Sonic Visualizer

%   remarks: 
%       both the annotation files have been created using Sonic Annotator,
%       a batch tool for feature extraction, Queen Mary University of
%       London, 2009.

%%  1. load the onsets and the beat/tempo annotations

dir = 'data set/beats/';                    %   directory for phrases
audiofile = '100BPM_half_vamp_qm_beats';   
filename = strcat(dir,audiofile,'.csv');

%   check whether is onsets or beats file
if (isempty(strfind(audiofile,'onsets')))
    %   beats file has two variable
    fid = fopen(filename);
    C = textscan(fid,'%f %s','Delimiter',',');
    beats = C{1};
    tempo = C{2};
    
    %   convert tempo cell to double values
    tmpMat = zeros(0,0);
    for n = 1:length(tempo)
        tmp = tempo{n};
        if ~isempty(tmp)
            tmp = str2double(tmp(2:7));
            tmpMat = cat(1,tmpMat, tmp);
        end
    end
    
    tempo = tmpMat;

else
    onsets = csvread(filename);
end


clear C fid tmpMat tmp optimalSub tmpMat;

%%  2. find similarities and select onsets on beat locations

%   strategy: 
%       given the beat location, define a small interval and define
%       the closest annotated onset when the absolute value of the difference
%       between the estimated beat location and the onset is smaller than the 
%       interval. Save it then into a new variable.
%   
%   expected result:
%       the timestamp variable should contains a number of onsets similar
%       to the overall number of beats detected

%   define a small interval
eps = 5e-2;

timestamps = zeros(0,0);
beatNo = zeros(0,0);

%   define the quantization (either 4th or 8th)
quantize = 'eight';

%   define an average tempo using a weighted mean
%   weigth tempi depending on the number of instances
tempi = unique(round(tempo));
means = zeros(length(tempi),1);
instances = cell(length(tempi),1);
count = 0;
for i = 1:length(tempi)
    instances{i} = find(round(tempo) == tempi(i));
    if (length(instances{i}) > length(tempo)*0.2)
        means(i) = mean(tempo(instances{i}))*length(instances{i});
        count = count + length(instances{i});
    end
end

%   compute weigthed average
avgTempo = sum(means)/count;

clear tmp toDiscard;

for n = 1:length(onsets)
    idx = find(abs(beats - onsets(n)) < eps);
    
    %   if exists a match, write down that onset
    if ~isempty(idx)
        timestamps = cat(1,timestamps,onsets(n));
        
        %   save also the corresponding beat number for late check
        %   obs: they should be consecutive integers
        beatNo = cat(1,beatNo, idx);  
        
        %   delete the used onset
        onsets(n) = 0;
    end
end

clear means instances;

%   check for correctness of selected onsets
idx = diff(beatNo);
toCheck = find(idx ~= 1);

%   integrate the beat locations when missing onsets
for n = 1:length(toCheck)
    toAdd = beats(beatNo(toCheck(n))+1);
    timestamps = cat(1,timestamps(1:toCheck(n)+(n-1)),toAdd,...
        timestamps(toCheck(n)+n:end));
end

%   obs: using the 100BPM_half, we have to keep in mind the anacrusis.
%   Therefore labelling starts from timestamps no. 2;
if (~isempty(strfind(audiofile,'half')))
    timestamps = timestamps(2:end);
    onsets(onsets < timestamps(1)) = [];
end

%   handle with onsets on sub-beats if quantization is on eigth-note
if strcmp(quantize,'eight')
    
    %   delete the used onsets
    onsets(onsets == 0) = [];
    
    %   compute the inter-onset interval
    iois = diff(onsets);
    
    %   assuming an average inter-onset interval, select the onset if the
    %   interval is reached 
    avgIoi = 60/avgTempo;
    subTimestamps = zeros(0,0);
    
    %   handle the case for missing onsets
    toCheck = find(iois > avgIoi*1.5);
    
    %   integrate the onset with a computation based on avgIoi
    for n = 1:length(toCheck)
        toAdd = onsets(toCheck(n)) + avgIoi;
        onsets = cat(1,onsets(1:toCheck(n)),toAdd,...
            onsets(toCheck(n)+1:end));
        
        %   update the index (everything's been shifted by 1)
        toCheck = toCheck + 1;
    end
    
    %   compute again the inter-onset interval
    if ~isempty(toCheck)
        iois = diff(onsets);
    end
    
    n = 1;
    while n < length(onsets)
        
        %   handle case for first onset
        if n == 1
            if abs(timestamps(1)-onsets(1)) < avgTempo*0.5
                subTimestamps = cat(1,subTimestamps,onsets(1));
            end
        end
        
        count = iois(n);
        
        while (abs(count-avgIoi) > 0.25)   
            n = n + 1;
            count = count + iois(n);
        end
        
        %   save the right onset
        subTimestamps = cat(1, subTimestamps, onsets(n+1));
        
        %   update the counter
        n = n + 1;
    end
    
    %   check for equal length
    if ~isequal(length(timestamps),length(subTimestamps))
        warning('beats and sub-beats time series do not match in length')
    end
    
    %   merge both time series
    tmp = zeros(0,0);
    for n = 1:length(timestamps)
        tmp = cat(1,tmp,timestamps(n),subTimestamps(n));
    end
    
    timestamps = tmp;
end

%   handle case with half precision (esp. fast tempi)
if strcmp(quantize,'half')
    timestamps = timestamps(1:2:end);
end


clear beatNo next eps toCheck toAdd idx quantize i;
clear subTimestamps avgIoi avgTempo beatNo count tempi tempoEps;

%%  3. create a label struct for the optimal onset selection

%   assumptions:
%       the meter is 4/4
%       simple structure `bd hh sd hh`


%   give the same label to the same metrical position
labStruct = cell(length(timestamps),1);
for n = 1:8:length(timestamps)
    %   loop over the total bar number
    labStruct{n} = 'bd';
    labStruct{n+1} = 'hh';
    labStruct{n+2} = 'hh';
    labStruct{n+3} = 'hh';
    labStruct{n+4} = 'sd';
    labStruct{n+5} = 'hh';
    labStruct{n+6} = 'hh';
    labStruct{n+7} = 'hh';
end

%%  4. export a .csv file to use as layer in Sonic Visualizer 

%   create file to write into
fid = fopen('100BPM_half_labels2.csv','w');

for n = 1:length(labStruct)    
    %   write each row in a .csv manner (not possile using csvwrite)
    fprintf(fid,'%f,%s\n',timestamps(n),labStruct{n});
end

%   save and close file
fclose(fid);

clear n fid;

%   save variables to be used inside mfccFit
[clusterStruct,labels,noClust] = createClusterstruct(labStruct);
save('100BPM_half_subbeats.mat');

%% eof