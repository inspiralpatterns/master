function P = birthday(n)
k = 365;
P = round((1 - exp(gammaln(k+1) - gammaln(k-n+1) - n*log(k))),4);
end
