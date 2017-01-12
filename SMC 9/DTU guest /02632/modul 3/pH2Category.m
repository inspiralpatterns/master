%% module 3 assignments
%
% acidity

function [category] = pH2Category(pH)
% pH2Category: converts a pH value to the corresponding category
%   I/0
%   pH: pH value (real scalar)
%   category: acidity category (string)

if pH < 0 || pH > 14
    category = 'pH out of range';
    
else
    % NB: when using switch with logical operators, the switch should be
    % TRUE either FALSE otherwise nothing will be selected
    switch true
        case 0 <= pH && pH <= 2
            category = 'Strongly acidic';
        case 3 <= pH && pH <= 5
            category = 'Weakly acidic';
        case 6 <= pH && pH <= 8
            category = 'Neutral';
        case 9 <= pH && pH <= 11
            category = 'Weakly basic';
        case 12 <= pH && pH <= 14
            category = 'Strongly basic';
            
        otherwise
            % if pH is between two cathegories, round and assign it to the
            % closest cathegory. Rounding depends whether the ph is acidic
            % or basic. 
            if pH < 6
                pH = floor(pH);
            else
                pH = ceil(pH);
            end
            
            switch true
                case 0 <= pH && pH <= 2
                    category = 'Strongly acidic';
                case 3 <= pH && pH <= 5
                    category = 'Weakly acidic';
                case 6 <= pH && pH <= 8
                    category = 'Neutral';
                case 9 <= pH && pH <= 11
                    category = 'Weakly basic';
                case 12 <= pH && pH <= 14
                    category = 'Strongly basic';
            end
    end
end

end

