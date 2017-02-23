%   createDataset.m
%   author:         Mattia Paterna
%   created:        January, 22nd 2017
%
%   purpose:
%       process the selected audio files with respect to the annotation for
%       a given drum piece, extract features (MFCC) and save them into a
%       cell matrix to be used.
%       
%       Every time a new storage variable is created, it is added to the
%       initial workspace. The workspace eventually is made of:
%       - a cell matrix containing MFCC for selected bd sounds
%       - a cell matrix containing MFCC for selected sd sounds
%       - a cell matrix containing MFCC for selected ohh sounds
%       - a cell matrix containing MFCC for selected chh sounds

clear;
load('dataset.mat');
whos('-file','dataset.mat')

%   load audio file and annotations
%   obs: to be changed manually
dir = 'data set';
subdir = 'mix';
filename = '098_phrase_funk_complex_fast_sticks';
[snd,fs] = audioread(strcat(dir,'/',subdir,'/',filename,'.wav'));

subdir = 'annotations';
fid = fopen(strcat(subdir,'/',filename,'.txt'));
data = textscan(fid,'%f %s');
timestamps = data{1};                                                      
labels = data{2};
fclose(fid);
clear data fid subdir dir;

%   select the onsets to use for segmentation depending on the drum piece
sel = 'chh';
islab = strcmpi(labels,sel);
idx = find(islab == 1);
onsets = timestamps(idx);

%   check for correctness
if ~isequal(length(idx),length(onsets))
    warning('warning: no. of onsets and indexes for the label do not match');
end

%   get segments corresponding to the selected onsets
%   obs: we are interested in getting MFCC for this label
sgmts = segmentsnd(snd, fs, onsets);

%   get MFCCs for each segment
attacklen = 0.2;
featStruct = featureextractionsgmt(sgmts,fs,attacklen);

%   save the new feature inside a common cell matrix
%   obs: each row corresponds to a new entry 

%   check for existence of init arrays
if ~exist('bd','var')
    %   if not exist, make it
    bd = zeros(0,0);
end

if ~exist('sd','var')
    %   if not exist, make it
    sd = zeros(0,0);
end

if ~exist('chh','var')
    %   if not exist, make it
    chh = zeros(0,0);
end

%   copy the mfcc set into the general cell matrix
switch sel
    case 'bd'
        bd = [bd; featStruct.sgmt_mfccs'];
    case 'sd'
        sd = [sd; featStruct.sgmt_mfccs'];
    case 'chh'
        chh = [chh; featStruct.sgmt_mfccs'];
end

%   save changes
%   obs: change cell matrix when changing instruments
save('dataset.mat','chh', '-append');


%%
% eof