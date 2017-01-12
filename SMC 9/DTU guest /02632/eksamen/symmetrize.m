function y = symmetrize(x)

len = length(x);
y = zeros(len);

for i = 1:len
    for j = 1:len
        if i == j
            y(i,j) = x(i,j);
        else
            y(i,j) = x(i,j) + x(j,i);
        end
    end

end