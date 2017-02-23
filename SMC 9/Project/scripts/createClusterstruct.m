function [clusterStruct,labels,noClust] = createClusterstruct(labStruct)
%   author:             Mattia Paterna
%   created:            January, 25th 2017
%   function name:      createClusterstruct
%   purpose:            generate a cluster representation of the original
%                       structure representation. The labels are replaced
%                       by a number, assuming each category of audio event
%                       as a separate group.
%   
%   input arguments
%       labStruct:      original structure representation
%
%   output arguments
%       clusterStruct:  cluster representation
%       labels:         labels inside the structure representation without
%                       repetition
%       noClust:        no of clusters in the structure



%   get labels and set a threshold based on the number of occurrencies
%   (a cluster must have at least a no. of events equal to threshold level)
labels = unique(labStruct);
noClust = length(labels);
clusterStruct = zeros(length(labStruct),1);

%   substitute the cluster number to each label
for i = 1:length(labStruct)
    for k = 1:noClust
        %   check if labels are equal and of equal length
        if (isempty(setdiff(labStruct{i}, labels{k}) == 1) &&...
                (length(labStruct{i}) == length(labels{k})))
            %   if so, get the corresponding cluster no.
            clusterStruct(i) = k;
            break;
        end
    end
end

end