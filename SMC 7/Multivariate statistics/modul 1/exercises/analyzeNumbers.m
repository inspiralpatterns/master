%% Exercise 3.1

function [] = analyzeNumbers(feat)

%compute min, max and mean
mini = min(feat);
maxi = max(feat);
ave = mean(feat);

%print them on the screen
fprintf('Minimum: %4.2f, Maximum: %4.2f, Average: %4.2f', ...
    mini, maxi, ave)

%create a file with all the numbers
newdata = [feat(1:10) feat(11:20) feat(21:end)];

%save all in a new .m file
save('new_numbers.mat', 'newdata', 'mini', 'maxi', 'ave');

end

