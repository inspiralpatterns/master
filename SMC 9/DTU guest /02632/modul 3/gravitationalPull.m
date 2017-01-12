%% module 3 assignments
%
% Piecewise function

function [g] = gravitationalPull(x)
% gravitationalPull: compute the gravitational pull of the earth given a
% distance x as input
%   I/O:
%   x: distance to the centre of the earth
%   g: gravitational pull

%---------------- define variables
g0 = 9.82;      % gravitational pull on the surface
r = 6.371e6;    % average radius of the earth

if x < 0
    disp('value is incorrect');
else
    for i = 1: length(x)
        switch true
            case r <= x(i)
                g(i) = g0 * (r^2/x(i)^2);
            case x(i) < r
                g(i) = g0 * (x(i)/r);
        end
    end
end

end

