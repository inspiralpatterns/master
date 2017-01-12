function  conf = confidence(x)

m = mean(x);
s = std(x);
n = length(x);

confMin = m - 2*(s/sqrt(n));
confMax = m + 2*(s/sqrt(n));

conf = [confMin, confMax];

end
