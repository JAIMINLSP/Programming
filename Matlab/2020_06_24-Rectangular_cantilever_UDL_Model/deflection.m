%% function to model the deflection of a cantilever beam from:
% 1) The points along the beam as an array "x"
% 2) The Second moment of area of the cross section of the beam "I"
% 3) Young's modulus of the material "E"
% 4) The length of the beam "L"
% 5) The UDL applied on the whole length of the beam "w"
%% the function returns:
% An array containing the deflections matching the array "x"

function def = deflection(x, I, E, L, w)
% using the deflection equation (derived from the bending moment equation):
def = (1/(E*I))*((L*w*x.^3/6)-(w*L^2*x.^2/4)-(w*x.^4/24));
end

%% JLSP
