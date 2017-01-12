function turtlePlot(turtleCommands)
% turtlePlot: takes a string turtleCommands which contains a series of length
% and angles as an input and generates a plot with the commands in the
% string
% 
%   INPUT VARIABLES 
%   turtleCommands: a turtleCommands format (string)
%
%   OUTPUT VARIABLES
%   none
%%

% Define local variables
% Calculate the number of segments
noPoint = (length(turtleCommands)+1)/2+1;
% matrix of points used for plotting
graphPoints = zeros(2,noPoint);
% canonical basis vector
dir = [1;0];

% Seperate the segment length and angles
len = turtleCommands(1:2:end);
phi = [0,turtleCommands(2:2:end)];

% Compute all the coordinates of the points of the plot
for i = 1:noPoint-1
    % compute the vector pointing to the next point using the previous one
    % and the previous drawing direction
    dir = [cos(phi(i)) -sin(phi(i)); sin(phi(i)) cos(phi(i))] * dir;
    % compute the next point
    graphPoints(:,i+1) = graphPoints(:,i) + len(i) * dir;
end

% Generate a plot and set proper parameters
plot( graphPoints(1,:),graphPoints(2,:) );
axis equal;

% Assign a plot title depending on the system chosen
% if len = 1, they have the same plot
if isequal(length(len),1) == 1
    N = 0;
    fprintf('Both the systems have the same graphical representation for %d iterations.\n', N);
    sel = 'Koch/Sierpisnki';
else
    % check if the number of segments is either even or odd
    if mod(length(len),2) == 0
        % calculate noIter
        N = round(log2(length(len))/2);
        sel = 'Koch Curve';
    else
        N = round(log(length(len))/log(3));
        sel = 'Sierpinski triangle';
    end
end

title([num2str(N),'  iterations of ',sel]);
% display the curve length
fprintf('The curve at iteration %d is %d segments long\n', N, length(len));
set(gca,'xtick',[]);
set(gca,'ytick',[]);

% xlabel('x label()');
% ylabel('y label()');
% legend('');

