function [userChoice] = displayMenu(menu)
% displayMenu: isplays a main menu, ask the user to pick a number 
% and returns the picked number.
%
%   INPUT VARIABLES
%   menu: menu containing options to be chosen (cell, each one
%   containing a string of characters)
%   
%   OUTPUT VARIABLES
%   userChoice: chosen option (scalar)
%%

% display menu options (curly brackets because variable is a cell)
for i = 1:length(menu)
    fprintf('\n%d. %s', i, menu{i}); 
end

% get a valid menu choice
userChoice = 0;
% check wheter user choice is not equal to any of the values in menu, and
% prompt the menu until the user select an appropriate one
while ~any(userChoice == 1:length(menu))                    
    userChoice = input('\nPlease choose an option and enter a number: ');
    % check for user's errors (e.g. return key pressed before inserting number)
    if isempty(userChoice) == 1
        fprintf('You have not selected any options.\n');
        % reset userChoice to zero and ask again
        userChoice = 0;
    end
end