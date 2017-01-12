%% projekt 2 main script
%--------------------------------------------------

%--------------------------------------------------
%% definitions

% Items for the main menu to be shown
mainMenu = {...
    'Choose the system',...
    'Generate plots',...
    'Quit'...
    };

% Items for Lindenmayer system menu
systemMenu = {...
    'Koch curve',...
    'Sierpisnki triangle',...
    };

% Type of systems
system = {...
    'Koch',...
    'Sierpinski',...
    };

%-------------------------------------------------
%% interactive script
clc
disp('------------------------------');
fprintf('Welcome to Lindenmayer Systems script.\n');

while true
    % display menu option and get chosen menu item
    mainOption = displayMenu(mainMenu);

    %-------------------------------
    % Create a Lindenmayer String
    if mainOption == 1
        systemChoice = displayMenu(systemMenu);
        noIter = input('\nPlease state the desired number of iterations: ');
        % define a maximum number of iterations
        maxIter = 15; % heuristic
        % warn the user and ask for another number
        while ~any(noIter == 0:maxIter)
            fprintf('%d iterations are computational too heavy\n', noIter);
            yn = input('Do you want to choose a new iteration number? (y/n): ','s');
            if strcmp(yn,'n') == 1
            else
                noIter = input('Please choose a new iteration number: ');
            end
        end
                
        % get the string for the selected system at iteration noIter
        LindenmayerString = LindIter(system{systemChoice}, noIter);
        
        % convert the string into a sequence of turtle graphics commands
        turtleCommands = turtleGraph(LindenmayerString,system{systemChoice});
        
    %------------------------------
    % Generate plots
    elseif mainOption == 2
        % check if turtleCommands exists and if not, warn the user
        if exist('turtleCommands','var') == 0 
            fprintf('You shold select the system and create a string before plotting.\n');
        else
            % plot the graphical representation of the system string
            turtlePlot(turtleCommands);
            fprintf('Press a button to close the plot and continue.')
            pause;
            close gcf;
        end
        
    %------------------------------
    % Quit the program  
    else
        fprintf('Thanks and goodbye!\n');
        break;
    end
end

%------------------------------------------------
%% EOF
