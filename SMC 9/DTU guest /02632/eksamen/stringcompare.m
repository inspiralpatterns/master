function disSimilarity = stringcompare(string1, string2)

% return letters in each array without repetitions
string1 = unique(string1);
string2 = unique(string2);
letterMatched = [];
j = 1;


for i = 1:length(string1)
    if any(string1(i) == string2) == 1
        letterMatched = [letterMatched string1(i)];
        if length(letterMatched) ~= 1
            j = j + 1;
        end
        string2(string2 == letterMatched(j)) = [];
    end  
end

for i = 1:length(letterMatched)
    string1(string1 == letterMatched(i)) = [];
end

disSimilarity = length(string1) + length(string2);

end
