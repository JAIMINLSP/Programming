clc;
clear;
% this program uses a Leslie matrix system in an attempt to approximate the future human population in the UK with rates taken from the office of national statistics pre covid, and it will be assumed that those who are able to give birth are those only within (later years of) adolescence and you to mid adulthood.
% there will be 4 groupings of ages:
% 1) newborn (0<years<=1)
% 2) child and early adolescent (1<years<=16)
% 3) late adolescent and young to mid adult (16<years<=49) (able to , and within legal bounds, reproduce)
% 4) late adult and elderly (49<years<=81)

% key statistics used are:
% - mean life expectancy of 81 years (ONS 2018)
% - population of the uk is 66,435,600 (ONS 2018)
% - mean fertility rate of 1.7 children per woman (ONS 2018)
% - 3.8 deaths per 1000 live births (ONS 2018)
% - of the population in 2018, 18.75% were <16years, 62.70% were 16<=years<=64 and 18.55% were >=65years

% assumptions:
% - all those above the age of 81 die
% - "graduation" from the 2nd to 3rd, and 3rd to 4th is 99%
% - "child bearing years" are between the years 16 to 49
% - the initial population of each age group initially in 2018 is approximated with a uniform distribution from the statistics provided
% - all births occur every 9 months

leslie = zeros(4); %constructing the leslie population matrix
leslie(1,:) = [0, 0, 1.7, 0]; %the fertility rate of each age group (using the statistic in 
leslie(2,:) = [0.9962, 0, 0, 0]; %ratio of newborns that graduate to the child and early adolescent group (from the 3.8 deaths out of 1000 births statistic)
leslie(3,:) = [0, 0.99, 0, 0]; %ratio of the 2nd age group that graduates to the 3rd age group
leslie(4,:) = [0, 0, 0.99, 0]; %ratio of the 3rd age group that graduates to the second age group

init = [0.77729652, 11.67937848, 28.64703072, 25.33189428]'; %population of each of the 4 ages groups approximated from the statistics provided (all in millions of people) in the end of 2018
x = [init, zeros(4, 12)];

for i = 2:13 %a for loop that loops through 9 months 12 times, and so finishes after 9 years are projected
x(:,i) = leslie*x(:,i-1); %calculating the population by the end of the next set of 9 months
end

time = ((9/12)*[0:12]);
pop = sum(x);
disp([time', x', pop']);

figure(1);
plot(time+2018,pop,'-xk');
title('Projected Population of the UK after 2018 using a Leslie matrix');
ylabel('Population / millions');
xlabel('Year');