% module 2 assignments
%
% sudoku row

function y = fillSudoluRow(x)
% efillSudokuRow: takes a Sudoku row with one missing entry and return the
% row with the entry filled in correctly.
%   I/O
%   a: input array with missing entry set to zero
%   p: filled array

miss = sum(1:9) - sum(x);
x(x<1) = miss;
y = x;

end