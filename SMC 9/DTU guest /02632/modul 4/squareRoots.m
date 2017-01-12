%% Exercise 4C
%
% approximation of a square root

a = 2;
x = a/2;
sqr = x;
sol = sqrt(2);
while (sqr~=sol)
    sqr = x;
    disp(sqr);
    if round(sqr,5) == round(sol,5)
        break;
    end
    x = (x + a/x)/2;
end