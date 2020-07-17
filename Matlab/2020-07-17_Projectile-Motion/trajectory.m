function [s,d] = trajectory(t,u,x,a)
s = (u*t)+(0.5*a*t.^2); %create an array that contains the vertical displacement at each instance of time
d = x*t; %create an array that contains the horizontal displacement at each instance of time
end