%% module 4 assignments
%
% removing incomplete experiments

function [idComplete] = removeIncomplete(id)
% removeIncomplete: return a vector of id-numbers where all incomplete
% experiments have been removed.
%   I/O
%   id: Id-numbers (vectors)
%
%   idComplete: Id-numbers of complete experiments (vectors)

n = max(round(id));
counter = 1;

while counter <= n
    nParts = id(round(id) == counter);
    if length(nParts) ~= 3;
        id(round(id) == counter) = [];
    end
    
    counter = counter +1;   % update the counter
end

idComplete = id;

end