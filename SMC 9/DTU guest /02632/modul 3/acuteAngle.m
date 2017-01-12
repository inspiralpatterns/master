%% module 3 assignments
%
% Angle between lines

function [theta] = acuteAngle(v1,v2)
% acuteAngle: compute the acute angle between two lines represented by 
% their unit vectors.
%   INPUT
%   v1,v2: unit vectors

dot_prod = v1*v2';
theta = acos(dot_prod);

if theta > (pi/2)
    theta = pi - theta;
end

end

