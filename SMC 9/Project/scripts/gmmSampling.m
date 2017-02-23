function [synData] = gmmSampling(seq,noDim,gmm)
%   author:             Mattia Paterna
%   created:            January, 17th 2017
%   function name:      gmmSampling
%   purpose:            generate synthtetic data from the mixture models, 
%                       with respect to an original state sequence
%   
%   input arguments
%       seq:            original state sequence
%       noDim:          no. of dimension 
%       gmm:            mixture model to sample from

%   output arguments
%       data:           random sample


%   create a m-by-n matrix to store draws
%   m: number of events
%   n: number of variables
synData = zeros(length(seq), noDim);
noClust = max(seq);

for n = 1:noClust
    %   get the event indexes for the label
    idx = find(seq == n);
    %   generate observation from the corresponding mixture model
    tmp = random(gmm{n},length(idx));

    %   fill the matrix with respect to the orginal sequence
    for j = 1:length(idx)
        synData(idx(j),:) = tmp(j,:);
    end
end


% case: mixture model for all data, each component corresponding to a label
% for i = 1:obj.NumComponents
%     %   get the event indexes for the cluster
%     idx = find(clusterStruct == i);
%     %   generate observation from the corresponding mixture
%     tmp = mvnrnd(obj.mu(i,:),obj.Sigma(:,:,i),length(idx));
%     %   fill the matrix with respect to the orginal sequence
%     for j = 1:length(idx)
%         DataFromFit(idx(j),:) = tmp(j,:);
%     end
% end