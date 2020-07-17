function vel = velocity(u,a,t,x)
v = u+(a*t); %create a vector to store the vertical velocity at each instance in time
vel = sqrt(v.^2+x.^2);
end