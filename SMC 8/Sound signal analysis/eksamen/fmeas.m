function [Fmeasure] = fmeas(gtfilename,peaks,fs,hop)
% EVALUATION
% compare groundtruth with detected onset and get F-measure
% evaluation for different onset detection functions

fid = fopen(gtfilename);                                                   
gt_data = textscan(fid,'%f %s');                                           
timestamps = gt_data{1}*fs;  
tolerance = 50*fs/1000; % value from `Machine Audition`, Wang (2010)

% create two vector with original timestamps and detected onsets
matchedOnsets = [];
toDelete = [];
onsets = peaks*hop;

% define variable for evaluation measure
tp = 0;
fp = 0;
fn = 0;

for i = 1: length(onsets)
    j = 0;
    
    % compare each detected onset with all the original timestamps
    while j < length(timestamps)
        j = j + 1;
        % if absolute distance falls between tolerance window, it is a
        % correct detection
        if abs(onsets(i)-timestamps(j)) < tolerance
            tp = tp + 1;
            
            toDelete = [toDelete, timestamps(j)];
            matchedOnsets = [matchedOnsets, onsets(i)];
        end
    end
    % delete all the correct detected onset from original timestamps vector
    for k = 1:length(toDelete);
        timestamps(timestamps == toDelete(k)) = [];
    end
    
    toDelete = [];
end

% delete all the correct detected onset from detected onsets vector
for i = 1:length(matchedOnsets)
    onsets(onsets == matchedOnsets(i)) = [];
end

% get tp, fp and fn
% (according to Mirex 2015: Audio Onset Detection Evaluation Performance)
% true positive, or correct detection: all the matched onsets
tp = length(matchedOnsets);
% false positive: all the unmatched detected onsets
fp = length(onsets);
% false negative: all the unmatched original timestamps
fn = length(timestamps);

% calculate F-measure
precision = tp/(tp+fp); 
recall = tp/(tp+fn);
Fmeasure = 2*precision*recall/(precision+recall);
end

