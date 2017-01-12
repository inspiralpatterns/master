function pFemale = genderGuess(name)
consonant = ['b ''c ''d ''f ''g ''h ''j ''k ''l ''m ''n ''p ''q ''r ''s ''t ''v ''w ''x ''z '];
wovels = ['a ','e ','i ','o ','u ','y '];


if any(name(end) == wovels(1:2:end)) == 1
    if  length(find(name == 'f')) > 1
        pFemale = 0.35;
    else
        pFemale = 0.87;
    end
else
    if name(1) == 'k'
        pFemale = 0.69;
    else
        pFemale = 0.25;
    end
end

end