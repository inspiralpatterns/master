% module 6 assignment
%
% Language Detection

function [E] = computeLanguageError(freq)
% computeLanguageError Summary of this function goes here
%   Detailed explanation goes here

letter_frequencies = readtable('letter_frequencies.csv');
E = zeros(1,15);

for i = 2: size(letter_frequencies,2)
    E(i-1) = sum((freq' - letter_frequencies{:,i}).^2);
end


