%% PROJEKT 1. BACTERIA ANALYSIS
%% MAIN SCRIPT

% initial variable declaration
% option selection variable
sel = [];
% filter selection variable
filter = [];
% statistics selection variable
statistic = [];

fprintf('Welcome to the Bacteria Analysis script.\nHere are some use options.\n\n');

if true
    sel = str2double(input...
        ('1. load data\n2. filter data\n3. display statistics\n4. generate plots\n5. quit the program\n Please select an option: ', 's'));
    while sel ~= 1 && sel ~= 5
        % if data loaded, do not show warning
        if exist('data') == 1
            fprintf('...Data loaded.\n\n');
            break
        else
            warning('you should load data first.');
            sel = str2double(input('Try again.\n...(press 1 to load data, 5 to quit): ', 's'));
        end
    end
end

%------- OPTION SELECTION
% (active until exist is not an empty matrix)
while exist('sel') == 1
    
    %--------1. LOAD DATA
    while sel == 1
        % if data already loaded, break
        if exist('data') == 1
            disp('...Data already loaded.');
            % ask for reloading, otherwise keep loaded data
            sel = input('Do you want to load data again?\n (y/n): ', 's');
            if strcmp(sel,'y') == 1;
                sel = 1;
            else
                sel = str2double(input('Choose another action: ', 's'));
                break
            end
        end
        
        % ask for an input and compare extension (this case: .txt)
        filename = input('Insert data filename: ', 's');
        while strcmp(filename(end-3:end),'.txt') == 0
            warning('file extension not correct');
            filename = input('...Insert data filename: ', 's');
        end
        % call function for loading data
        data = dataLoad(filename);
        
        % clear filename to avoid keeping wrong file name in the workspace
        clear filename;
        
        % go further with the options selection
        sel = str2double(input('Choose another action: ', 's'));
        
        % check for a different number
        while sel == 1
            warning('data already loaded');
            sel = str2double(input('...Choose another action: ', 's'));
        end
    end
  
    
    % make a backup if disabling the filter conditions
    % do it once only if dataBackup doesn't exist
    if exist('dataBackup') == 0
        dataBackup = data;
    end
    
    %--------2. FILTER DATA
    while sel == 2           
        if isequal(filter,0) == 0
            filter = str2double(input...
                ('Choose the filter type:\n1. Bacteria specific type\n2. Temperature range\n3. Growth Rate range\n\n0. exit\n9. disable filters\n Please select an option: ', 's'));
        end
        switch filter
            case 1
                filterType = 'bacteria specific type';
            case 2
                filterType = 'temperature range';
            case 3
                filterType = 'growth rate range';
            case 0
                sel = str2double(input('Choose another option:\n1. load data\n2. filter data\n3. display statistics\n4. generate plots\n5. quit the program\n ', 's'));
                if isequal(sel,2) == 1
                    filter = [];
                end
                
        end
        
        % keep filter option active while filter variable has a value
        while filter ~= 0
            % create empty variable for bacteria type no.
            bacteriaTypeNo = [];
            if filter == 1
                while isempty(bacteriaTypeNo) == 1
                    bacteriaTypeNo = str2double(input...
                        ('...Write bacteria type:\n1. Salmonella Enterica\n2. Bacillus cereus\n3. Listeria\n4. Brochothrix thermpsphacta\nInsert a number: ', 's'));
                    switch bacteriaTypeNo
                        case 1
                            bacteriaType = 'Salmonella Enterica';
                        case 2
                            bacteriaType = 'Bacillus cereus';
                        case 3
                            bacteriaType = 'Listeria';
                        case 4
                            bacteriaType = 'Brochothrix thermpsphacta';
                        otherwise
                            warning('Type not found');
                            bacteriaTypeNo = [];
                    end
                end
                
                % filter data according bacteria type selection
                data = data(data(:,3) == bacteriaTypeNo,:);
                fprintf('Only %s type shown.\n', bacteriaType);
                
                filter = str2double(input('Choose another filtering option: ', 's'));
            end
            
            
            if filter == 2
                tempRange = str2num(input('Choose temperature range (min,max):', 's'));
                % check if both values have been entered
                if length(tempRange) ~= 2
                    tempRange = str2num(input('You must insert two values (min,max): ', 's'));
                end
                % if the input range is invalid, flip the vector
                if tempRange(2) < tempRange(1)
                    fliplr(tempRange);
                end
                % filter data according temperature range selection
                data = data(data(:,1) > tempRange(1) & data(:,1) < tempRange(2),:);
                fprintf('Temperature between %f and %f.\n', tempRange(1), tempRange(2));
                
                filter = str2double(input('Choose another filtering option: ', 's'));
            end
            
            
            if filter == 3                
                % check if input is correct
                growthRange = [];
                while isequal(length(growthRange),2) == 0
                    growthRange = str2num(input('Choose growth rate range.\nThere should be two values (min,max):', 's'));
                    if growthRange(2) < growthRange(1)
                        % if the input range is invalid, flip the vector
                        fliplr(growthRange);
                    elseif sum(growthRange < 0 | growthRange > 1) ~= 0
                        growthRange = str2num(input('Values between 0 and 1 (min,max): ', 's'));
                    end
                end
                
                % 
                % filter data according growth range selection
                data = data(data(:,2) > growthRange(1) & data(:,2) < growthRange(2),:);
                fprintf('Growth rate between %f and %f.\n', growthRange(1), growthRange(2));
                
                filter = str2double(input('Choose another filtering option: ', 's'));
            end
            
            
            if filter > 3 && filter ~= 9
                warning('Incorrect filter type.');
                filter = str2double(input('...Try again: ', 's'));
            end
            
            
            if filter == 9
                data = dataBackup;
                disp('All filters have been disabled.');
                filter = input('Do you want to filter data again?\n (y/n): ', 's');
                if strcmp(filter,'y') == 1;
                    filter = str2double(input('Choose another filtering option: ', 's'));
                else
                    filter = 0;
                end
            end
        end
        if length(data) < 1
            warning('All data have been filtered.');
        end
    end
        
    
    %--------3. DISPLAY STATISTICS
    while sel == 3
        
        % check for any previous filtering
        if isempty(statistic) == 1
            if length(data) ~= length(dataBackup)
                fprintf('Data has been filtered.\n');
                fprintf('...Last filtering is: %s\n\n', filterType);
                filterOnOff = 'filtered';
            else
                fprintf('Data has not been filtered.\n\n');
                filterOnOff = 'non-filtered';
            end
        end
        
        % prompt for statistic selection
        fprintf('Possible statistics are\n...Mean Temperature\n...Mean Growth Rate\n...Std Temperature\n...Std Growth Rate\n...Rows\n...Mean Cold Growth Rate\n...Mean Hot Growth Rate\n\n');
        statistic = input('Write the chosen statistic: ', 's');
        % get statistic and print it along with description
        result = dataStatistics(data,statistic);
        fprintf('%s is: %f for %s data\n', statistic, result,filterOnOff);
        
        % ask for more statistic or exit the choice
        statistic = input('Do you want to get statistics again?\n (y/n): ', 's');
        if strcmp(statistic,'y') == 1;
        else
            sel = str2double(input('Choose another option:\n1. load data\n2. filter data\n3. display statistics\n4. generate plots\n5. quit the program\n ', 's'));
        end
    end
    
    
    %--------4. GENERATE PLOTS
    while sel == 4
        if length(data) ~= length(dataBackup)
            fprintf('Data has been filtered.\n');
            fprintf('...Last filtering is: %s\n\n', filterType);
            filterOnOff = 'filtered';
        else
            filterOnOff = 'non-filtered';
        end
        
        fprintf('...plotting for %s data\n\n', filterOnOff);
        dataPlot(data);
        quit = input('Do you want to quit the program? (y/n): ', 's');
        if strcmp(quit,'y') == 1
            sel = 5;
        else
            sel = str2double(input('Choose another option:\n1. load data\n2. filter data\n3. display statistics\n4. generate plots\n5. quit the program\n ', 's'));
        end
    end
    
    
    %--------5. QUIT SCRIPT
    while sel == 5
        d = date();
        fprintf('Thanks for have used it!\n...Designed in København d. %s .\n', d);
        return
    end
end

%%%----------EOF----------%%%