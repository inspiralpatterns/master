% module 6 assignments
%
% Frequency of letters

function [freq] = letterFrequency(filename)
% letterFrequency: computes the frequency of each letter in the text
% returning a 26-long vector with the frequency in percent of each
% character. PS: not sensitive to case.
%
%   INPUT VARIABLE
%   filename: filename of the plain text file to load (string)
%
%   OUTPUT VARIABLE
%   freq: frequency of occurrence of each letter (vector)

% read text and make it lowerized
% NB: even commas, dots and parentheses are symbols!
text = lower(fileread(filename));

% define an alphabet string to compare 
Alphabet = 'abcdefghijklmnopqrstuvwxyz';

freq = zeros(1,length(Alphabet));

% compare the text with each letter in Alphabet string and compute the
% percentage
for i = 1:length(Alphabet)
    letter = text(text == Alphabet(i));
    freq(i) = (length(letter));
end

len = sum(freq);
freq = (freq/len)*100;

end

%--------HINT---------
% to compute the correct percentage, the total length should be calculated
% only on letters and not on grammar symbols.

