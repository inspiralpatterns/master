function turtleCommands = turtleGraph(LindenmayerString,system)
% turtleGraph translates a Lindenmayer String into a row vector which
% specifies the length and angles of every line segment
% 
%   INPUT VARIABLES 
%   LindenmayerString: either Koch string which contains only 'S','L' and
%   'R',or Sierpinski string which contains only 'A','B','L' and 'R'
% 
%   OUTPUT VARIABLES
%   turtleCommands: a row vector which is the turtle commands traslated
%   from the input string
%%

% Initialize the turtleCommands matrix
turtleCommands=zeros(size(LindenmayerString));

% specify if the string is Koch or Sierpinski 
switch system
    case 'Koch'
        % compute the length of the segment by counting 'S'
        segLength = power (1/3, log2(sum(LindenmayerString=='S')/2));
        turtleCommands(LindenmayerString=='S') = segLength;
        turtleCommands(LindenmayerString=='L') = pi/3;
        turtleCommands(LindenmayerString=='R') = - 2*pi/3;
        
    case 'Sierpinski'
        % compute the length of segment by couting either 'A' or 'B'
        segLength = power (1/2, log(sum((LindenmayerString =='A')+...
            (LindenmayerString == 'B')))/log(3));
        turtleCommands(LindenmayerString=='A') = segLength;
        turtleCommands(LindenmayerString=='B') = segLength;
        turtleCommands(LindenmayerString=='L') = pi/3;
        turtleCommands(LindenmayerString=='R') = -pi/3;
        
    otherwise
        % give warning if the Lindenmayer string is not valid
        warning('This is not a Lindenmayer string');
end

end