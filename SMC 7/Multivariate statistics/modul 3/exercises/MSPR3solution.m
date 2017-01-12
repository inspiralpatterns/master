%% Ex 2

load cloud.mat %loads the points in X
u1 = [1 1 0]';
u2 = [0 1 1]';
NoS = 100;
plantype={'xy', 'yz', 'diag'};
clear tau;
for i=1:length(plantype),
    
    if strcmp(plantype{i}, 'xy'),
        a1 = [1 0 0]';
        a2 = [0 1 0]';
    elseif strcmp(plantype{i}, 'yz'),
        a1 = [0 1 0]';
        a2 = [0 0 1]';
    else strcmp(plantype{i}, 'diag'),
        a1 = u1;
        s2 = u2;
    end

A = [a1 a2];
P = A*(inv(A'*A))*A';
p = P*X;
tau(i) = sum(sum(p.^2,1))/sum(sum(X.^2,1))
end
