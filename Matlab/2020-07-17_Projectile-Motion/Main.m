clc;
clear;

a = -9.81; %acceleration due to gravity in (m/s^2)
angle_deg = 45; %angle of projection in degrees
angle_rad = angle_deg*(pi/180); %conversion of angle into radians

init_vel = 50; %initial velocity at the projection angle (m/s)
u = sin(angle_rad)*init_vel; %initial vertical component of velocity
x = cos(angle_rad)*init_vel; %initial horizontal component of velocity

max_t = (-2*u)/a; %the full time of flight (S);
t = [0:0.01:max_t]; %vector of instances of time by which the trajectory is found (s)

[s,d] = trajectory(t,u,x,a); %obtain the vertical and horizontal vectors for displacement.

vel = velocity(u,a,t,x);

figure(1); %create a figure for the plots
subplot(1,2,1); %create and move to the first subplot for the trajectory path
plot(d,s,'--k'); %plotting the flight path
xlabel('Horizontal displacement / m');
ylabel('Vertical displacement / m');
title(['Trajectory path of the projectile ',num2str(init_vel),'m/s',' at ',num2str(angle_deg),' degrees']);
legend('Flight path');
subplot(1,2,2); %move to the second subplot
plot(t,vel,'-k');
xlabel('Time / s');
ylabel('Velocity / m/s');
title('Velocity profile of projectile over time');
legend('Velocity')
