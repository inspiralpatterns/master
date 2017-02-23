function [optimalStruct,bestClustNo] = clusterDet(meas,maxClustNo)
%   author:             Mattia Paterna
%   created:            January, 29th 2017
%   function name:      clusterDet
%   purpose:            determine the number of clusters given a dataset.
%                       The determination is made using the Variance-Ratio 
%                       Criterion, known also as Calinski-Harabasz evaluation.
%   
%   input arguments
%       meas:           sample data
%       maxClustNo:     max number of clusters allowed
%
%   output arguments
%       bestClustNo:    number of cluster with most counts during the
%                       multiple evaluation
%       optimalStruct:  optimal cluster solution sequence
%
%   note:
%      The Calinski-Harabasz criterion is best suited for k-means
%       clustering solutions with squared Euclidean distances
%


%   create an array to store OptimalK
K = zeros(maxClustNo,1);

%   repeat the cluster evaluation
for n = 1:100
    eva = evalclusters(meas,'kmeans','CalinskiHarabasz','KList',1:maxClustNo);
    K(eva.OptimalK) = K(eva.OptimalK) + 1;
end

%   prepare data for histogram
x = zeros(0,0);
for n = 1:maxClustNo 
    if K(n) > 0
        x = cat(1,x,ones(K(n),1)*n);
    end
end

%   plot the histogram of the evaluation results and the Calinski-Harabasz
%   criterion value for each number of cluster tested
figure(1);
h = histogram(x,maxClustNo,'BinLimits',[1 maxClustNo]);
grid on;

figure(2);
plot(eva);
grid on;

%   get the optimalK with most repetitions and the optimal sequence
bestClustNo = find(h.Values == max(h.Values));
optimalStruct = eva.OptimalY;

end
