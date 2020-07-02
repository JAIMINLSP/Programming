%% function to model the deflection of a cantilever beam from the: 
% 1) The points along the beam as an array "x"
% 2) The Second moment of area of the cross section of the beam "I"
% 3) Young's modulus of the material "E"
% 4) The length of the beam "L"
% 5) The point load applied at the end of the beam "P"
%% the function returns:
% An array containing the deflections matching the array "x"

function def = deflection(x, I, E, L, P)
% using the deflection equation (derived from the bending moment equation):
def = (1/(E*I))*(((1/6)*(P*x.^3)) - ((1/2)*(L*P*x.^2)));
end

%% JLSP