function [timestamps,true_lab] = mergeOnset(filename,threshold)
% merge onset labels given each pair of onset whose distance is whithin a
% specific threshold. If not specified, threshold is set to 0.01 s.

% initialization for insufficient input variables
if nargin < 2
    if nargin < 1
        fprintf('Error: filename needed!\n')
    end
    threshold = 0.01;
end

% read and scan file
fid = fopen(filename);
data = textscan(fid,'%f %s');

timestamps = data{1};                                                      % get timestamp list
true_lab = data{2};                                                        % get true labels

idx = find(diff(timestamps)<threshold);                                    % get the list of close onset given a threshold

for i = 1:length(idx)-1                                                    % for each pair of close onsets
    
    toappend = [true_lab(idx(i)),true_lab(idx(i)+1)]; 
    
    if (idx(i+1)-idx(i)==1); toappend = [toappend,true_lab(idx(i)+2)]; end
    
    toappend = sort(toappend);
    
    mystr = '';
    for ii = 1:length(toappend)
        mystr = strcat(mystr,toappend(ii));
        if ii < length(toappend)
            mystr = strcat(mystr,'_');
        end
    end
    
    true_lab(idx(i)) = mystr;
end
true_lab(idx+1) = [];
timestamps(idx+1) = [];
end