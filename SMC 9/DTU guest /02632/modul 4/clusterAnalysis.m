function [clusterAssignments] = clusterAnalysis(reflectance)
% clusterAnalysis: takes a vector of reflectance measurements and returns a
% vector of cluster assignments computed using the algorithm specified in
% the script
%
%   INPUT VARIABLES
%   reflectance: reflectance measurements (vector)
%
%   OUTPUT VARIABLES
%   clusterAssignments: final cluster assignments (vector of 1 or 2)

N = length(reflectance);
% initialize clusterAssignments
clusterAssignments = mod(0:N-1,2) + 1;
clusterAssignmentsNew = zeros(1,N);

while ~all(clusterAssignments == clusterAssignmentsNew)         % i.e. while all not the values are equals:
    
    clusterAssignmentsNew = clusterAssignments;
    
    %update step
    mean1 = mean(reflectance(clusterAssignments == 1));
    mean2 = mean(reflectance(clusterAssignments == 2));
    
    % calculate reflectance distances from each mean
    dist1 = abs(reflectance - mean1);
    dist2 = abs(reflectance - mean2);
    
    % assignment step
    for i  = 1:length(reflectance)
        if dist1(i) <= dist2(i)
            clusterAssignments(i) = 1;
        else
            clusterAssignments(i) = 2;
        end
    end   
end
    
end

