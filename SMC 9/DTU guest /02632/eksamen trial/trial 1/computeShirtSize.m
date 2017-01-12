function [shirtSize] = computeShirtSize(chest,waist)

% definitions
groups = {...
    'Small',...
    'Medium',...
    'Large',...
    'X-Large',...
    'XX-Large',...
    'Not available',...
    };

chests = {
    (38:0.1:42),...
    (40:0.1:44),...
    (42:0.1:46),...
    (44:0.1:48),...
    (46:0.1:50),...
    };

waists = {
    (30:0.1:35),...
    (32:0.1:37),...
    (34:0.1:39),...
    (36:0.1:41),...
    (38:0.1:43),...
    };


% script

if chest < 38 || chest > 50
    shirtSize = groups{6};
    return;
end

if waist < 30 || waist > 43
    shirtSize = groups{6};
    return;
end

chestSize = cell(1,length(chests));
waistSize = cell(1,length(waists));
chest = round(chest,1);
waist = round(waist,1);
shirtSize = [];

for i = 1:length(chests)
    if any(chest == chests{i}) == 1
        chestSize{i} = groups{i};
    end
    
    if any(waist == waists{i}) == 1
        waistSize{i} = groups{i};
    end
    
    if isempty(chestSize{i}) ~= 1
        if isequal(chestSize{i}, waistSize{i}) == 1
            shirtSize = groups{i};
            return;
        end
    end
end

if isempty(shirtSize) == 1;
    shirtSize = groups{end};
end

end

