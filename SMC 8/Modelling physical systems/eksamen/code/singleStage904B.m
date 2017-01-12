function [z,out] = singleStage904B(x,z,g)
%                          MOOG 904B HIGHPASS FILTER
%               *** 1-POLE HIGHPASS FILTER DISCRETIZATION***
%
%   904BsingleStage: single stage Moog 904B high-pass filter implementation
%   using a bilinear integrator 
%   (a.k.a transposed canonical trapezoidal integrator)
%   based on the implementation shown in Zavalishin, Vadim. "The Art of VA 
%   Filter Design." (2012).
%
%   Author: Diego Di Carlo, Mattia Paterna
%   Date:   07 June 2016
%
%   This filter is TPT, i.e. Topology Preserved Transform
%   
%   INPUT VARIABLES
%   x: input signal
%   g : gain factor
%   z : integrator output
%
%   OUTPUT VARIABLES
%   z : filter current state
%   out : integrator output
%
%   Author: Diego Di Carlo, Mattia Paterna 
%   Date:   07 June 2016

%   form output of node + register
v = (x - z)*g;

%   (out is the output variable for HPF)
y = v + z;
out = x - y;

%   setup for next time through
z = y + v;
end