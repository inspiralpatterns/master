function [stateTime] = acState(state, timeStamp)

% definitions
stateCode = (0:4);
stateTime = zeros(1,length(stateCode));

% script
if length(state) ~= length(timeStamp)
    return;
end

for i = 1:length(stateCode)
    partialTime = 0;
    idx = find(state == stateCode(i));
    if isempty(idx) ~= 1
        for k = 1:length(idx)
            if idx(k)+1 <= length(timeStamp)
            partialTime = [partialTime, abs(timeStamp(idx(k))...
                - timeStamp(idx(k)+1))];
            end
        end
        stateTime(i) = sum(partialTime);
    end
end

end
