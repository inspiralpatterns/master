function [lind] = initializeLind(initialString,replacementRules,letterToReplace)
% initializeLind: initializes the output structure given input variables
%   
%   INPUT VARIABLES
%   initialString: Lindenmayer System initial string
%   replacementRules: string(s) containing the rules applied to each iteration 
%   letterToReplace: define the letter to be changed in every iteration
%   
%   OUTPUT VARIABLES
%   lind: structure containing initial string, replacement rules and letter
%   to change within a Lindenmayer System
%
%   OBS: both replacementRules and letterToReplace must be cells!
%%

%initialize output structure
% (obs: with cell, it is possible to access the whole string with a single index)
lind.string = initialString;
lind.systemAlphabet = cell(1,length(replacementRules));
lind.letterToReplace = cell(1,length(letterToReplace));

% fill the output structure with input replacement rules
n = 0;
while n < length(replacementRules)
    n = n + 1;
    lind.replacementRules(n) = replacementRules(n);
    lind.letterToReplace(n) = letterToReplace(n);
end;

end

