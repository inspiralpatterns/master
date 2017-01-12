function [score] = computePassesGoalLine(point,directionVector)
% computePassesGoalLine: tells whether or not the ball will pass the goalline 
% (in either of the two goals) if it continues from the initial position in 
% a straight line along the direction vector. 
%
%   INPUT VARIABLES
%   point: (x, y) coordinates of the initial ball position (vector)
%   directionVector: direction of kicked ball (vector)
%
%   OUTPUT VARIABLES
%   score: 1 for the ball to pass the goal line, 0 otherwise (boolean)

% get the direction of the ball (left/right)
if directionVector(1) > 0
    % will pass the goal line on the right
    xGoal = 105;
else
    % will pass the goal line on the left
    xGoal = 0;
end

% calculate alpha and the y-coordinate for the ball at xGoal
alpha = (xGoal - point(1))/directionVector(1);
yGoal = point(2) + alpha*directionVector(2);

switch true
    case yGoal > 30.34 && yGoal < 37.66
        score = 1;
    otherwise
        score = 0;
end

end

