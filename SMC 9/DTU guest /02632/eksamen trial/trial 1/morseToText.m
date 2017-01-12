function [text] = morseToText(morseCode)

% definitions
% define the alphanumeric alphabet
Alphabet = {'A','B','C','D','E','F','G','H','I','J','K','L','M','N',...
    'O','P','Q','R','S','T','U','V','W','X','Y','Z',' '};
% define the Morse alphabet
Morse = {'.-','-...','-.-.','-..','.','..-.','--.','....','..','.---','-.-',...
    '.-..','--','-.','---','.--.','--.-','.-.','...','-','..-','...-','.--',...
    '-..-','-.--','--..','  '};

%% script
% find spaces to detect single Morse letter
spaces = find(morseCode == ' ');
% add two extra-spaces at the beginning and the end (for a correct
% computation inside the while loop)
spaces = [0, spaces, length(morseCode)+1];
% find double spaces (i.e. a space in the standard alphabet)
spaceIdx = find(diff(spaces) == 1)+1;

% initialize counters
j = 1;  % for double spaces vector
i = 1;  % for single spaces vector
text = [];  % output vector

% compute a loop over the whole length of single spaces vector
while i < length(spaces)
    % update the counter
    i = i + 1;
    % check if more than one word is present
    if isempty(spaceIdx) ~= 1
        % check if index i is at a double space position
        if i == spaceIdx(j)
            % if so, add a space between words
            text = [text ' '];
            % if more than one double space is present
            if length(spaceIdx) ~= 1
                % update double-space vector counter if it's not at its end
                if j == length(spaceIdx)
                else
                    j = j+1;
                end
            end
        end
    end
    
    % scan a single word in Morse code
    word = morseCode(spaces(i-1)+1:spaces(i)-1);
    
    % check for the corresponding standard alphabet translation
    for k = 1:length(Alphabet)
        if isequal(word, Morse{k}) == 0
        else
            % put all the letters and spaces together
            text = [text Alphabet{k}];
            break;
        end
        
    end
    
end