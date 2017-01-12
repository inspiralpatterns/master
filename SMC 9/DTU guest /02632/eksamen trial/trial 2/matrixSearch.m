function index = matrixSearch(A,x)

[M,N] = size(A);
i = 1;
j = N;
index = [0,0];

while i <= M && j > 0
    a = A(i,j);
    if a == x
        index = [i,j];
        break;
    else
        if a > x
            j = j-1;
        else
            i = i+1;
        end
    end
end

end