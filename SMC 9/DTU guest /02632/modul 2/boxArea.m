% module 2
%
% Box area

function [A] = boxArea(boxCorners,area)
% boxArea: computes the area according to a string that specifies which
% kind of area to compute
%   
%   I/0
%   boxCorners: coordinates defining the two boxes (vector of length 8)
%   area: string that specifies what to compute
%
%   A: computed area

area = lower(area);

% extract coordinates
x1 = boxCorners(1);
x2 = boxCorners(2);
x3 = boxCorners(3);
x4 = boxCorners(4);
y1 = boxCorners(5);
y2 = boxCorners(6);
y3 = boxCorners(7);
y4 = boxCorners(8);

% compute different areas
A1 = (x2-x1)*(y2-y1);
A2 = (x4-x3)*(y4-y3);
A3 = max(0,min(x2,x4) - max(x1,x3))*max(0,min(y2,y4) - max(y1,y3));

switch area
    case 'box1'
        A = A1;
    case 'box2'
        A = A2;
    case 'intersection'
        A = A3;
    case 'union'
        A = A1 + A2 - A3;
end

end

