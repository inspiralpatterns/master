function [phaseOut] = princarg(phaseIn)
% PRINCARG: maps phasein into the [-pi:pi] range

phaseOut=mod(phaseIn+pi,-2*pi)+pi;
end

