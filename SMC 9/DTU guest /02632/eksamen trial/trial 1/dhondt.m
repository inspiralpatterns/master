function [seatsAllocated] = dhondt(votes, seats)

%script

q = zeros(1,length(votes));
s = zeros(1,length(votes));

for i = 1: seats
    for k = 1: length(votes)
        q(k) = votes(k)/(s(k) + 1);
    end
    
    idx = find(q == max(q));
    if length(idx) > 1
        idx = find(votes == max(votes(idx)));
    end
    
    s(idx) = s(idx) + 1;
end

seatsAllocated = s;

end