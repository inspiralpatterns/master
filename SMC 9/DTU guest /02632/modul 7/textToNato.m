function [natoText] = textToNato(plainText)
% natoText: spells out a word in the NATO alphabet.
%   
%   INPUT VARIABLES
%   plainText: string of text
%
%   OUTPUT VARIABLES
%   natoText: output in dash separated NATO alphabet

plainText = lower(plainText);
len = length(plainText);
words = cell(1,len);
natoText = [];
n = 1;

while n <= len
    switch plainText(n)
        case 'a'
            words{n} = 'Alpha';
        case 'b'
            words{n} = 'Bravo';
        case 'c'
            words{n} = 'Charlie';
        case 'd'
            words{n} = 'Delta';
        case 'e'
            words{n} = 'Echo';
        case 'f'
            words{n} = 'Foxtrot';
        case 'g'
            words{n} = 'Golf';
        case 'h'
            words{n} = 'Hotel';
        case 'i'
            words{n} = 'India';
        case 'j'
            words{n} = 'Juliet';
        case 'k'
            words{n} = 'Kilo';
        case 'l'
            words{n} = 'Lima';
        case 'm'
            words{n} = 'Mike';
        case 'n'
            words{n} = 'November';
        case 'o'
            words{n} = 'Oscar';
        case 'p'
            words{n} = 'Papa';
        case 'q'
            words{n} = 'Quebec';
        case 'r'
            words{n} = 'Romeo';
        case 's'
            words{n} = 'Sierra';
        case 't'
            words{n} = 'Tango';
        case 'u'
            words{n} = 'Uniform';
        case 'v'
            words{n} = 'Victor';
        case 'w'
            words{n} = 'Whiskey';
        case 'x'
            words{n} = 'Xray';
        case 'y'
            words{n} = 'Yankee';
        case 'z'
            words{n} = 'Zulu';
    end
n = n + 1;
end

for n = 1: length(words)
    natoText = [natoText words{n} '-'];
end

natoText = natoText(1:end-1);   % delete last dash

end

