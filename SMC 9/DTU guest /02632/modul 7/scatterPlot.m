% module 7 exercise
%
% Scatter plot

x = unidrnd(20,1,2000);
x = x - 10;
y = unidrnd(20,1,2000);
y = y - 10;

figure;
hold all;   % continue drawing on the same axis
grid on;    % grid enabled
axis equal; % use same unit measure for both axis

for i = 1: length(x)
    if max(abs(x(i)), abs(y(i))) > 5 && sqrt(x(i)^2+y(i)^2) < 10
        plot(x(i),y(i),'b*');
        hold all
    end
end
        