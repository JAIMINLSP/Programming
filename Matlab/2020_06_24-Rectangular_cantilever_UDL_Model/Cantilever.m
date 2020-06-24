clc;
clear;

%% Define the parameters for the deflection function:
L = 10; % m
n = 100; % number of points along the beam to be modelled
x = linspace(0, L, n); % m
% Assuming a rectangular cross section:
b = 0.5; % m
h = 0.5; % m
I = b*h^3/12; % m^4
E = 9e9; % N/m^2 (pine wood)
w = 100; % N/m

% deflection of each point along beam in x:
def = deflection(x, I, E, L, w); % m

% plotting the deflection:
figure(1);
plot(x, def, 'b--');
hold on;
plot([0, L], [0, 0], 'k-', 'LineWidth', 2);
hold off;
xlabel('distance from fixed end / m');
ylabel('Deflection / m');
title('Deflection of a rectangular cross section cantilever beam under UDL');
legend('Loaded', 'Unloaded');

%% JLSP

