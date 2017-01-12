% module 6 assignments
%
% production cost

function [itemCost] = computeItemCost(resourceItemMatrix,resourceCost)
% computeItemCost: computes the cost of each item and returns it as a
% vector
%
%   I/O
%   resourceItemMatrix: how many unit of each resource is required for each
%   item (matrix)
%   resourceCost: cost of each resource (vector)
%
%   itemCost: cost of each item (vector)

% get the number of items (i.e. numbers of columns)
noItem = size(resourceItemMatrix,2);

itemCost = zeros(noItem,1);

for i = 1:noItem
    itemCost(i) = resourceCost * resourceItemMatrix(:,i);
end

end
