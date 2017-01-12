function [LindenmayerString] = LindIter(System, N)
% LindIter: calculates N iterations of the system specified by the input
% variable 'System', according to its specific replacement rules.
% (see Lindenmayer Systems for further details)
%
%   INPUT VARIABLES
%   System: specification for the Lindenmayer System, could be 'Koch' or
%   'Sierpisnki' (string)
%   N : number of iterations to be calculated (scalar)
%
%   OUTPUT VARIABLES
%   LindenmayerString: iteration output (string)
%%

% A. choose the system and assign the correct alphabet letter
switch System
    case 'Koch'
        lind = initializeLind('S',{'SLSRSLS'},{'S'});
    case 'Sierpinski'
        lind = initializeLind('A',{'BRARB', 'ALBLA'},{'A','B'});
    otherwise
        % print a warning, clear the variable, end function
        warning('System not found');
        lind.string = [];
        return;
end


% B. iteration of the system
pin = 0;
while pin < N
    pin = pin + 1;
    
    % take every string charachter and assign it to a specific cell
    % (doing so, we preserve the original indexing during the replacement)
    for n = 1:length(lind.string)
        lind.tmpString{n} = lind.string(n);
    end
    
    % find the indexes for the letters to be replaced
    for n = 1:length(lind.letterToReplace)
        lind.replacementIndex{n} = find(lind.string == lind.letterToReplace{n});
        
        % replace if the indexes cell is not emtpy
        if isempty(lind.replacementIndex{n}) == 0
            for k = 1 : length(lind.replacementIndex{n})
                % multilevel indexing to access part of a cell
                lind.tmpString{lind.replacementIndex{n}(k)} = lind.replacementRules{n};
            end
        end
    end 
    
    % convert cells into a string, overwrite the initial one and delete any
    % possible space
    lind.string = strjoin(lind.tmpString);
    lind.string(find(lind.string == ' ')) = [];
end

% assign the resulting string to the output
LindenmayerString = lind.string;

end

