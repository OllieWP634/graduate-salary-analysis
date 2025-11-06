% Function with atleast one or more input and output arguments.

% Plots the graphs of UK Average, and average Part Time salaries on the
% same graph that the user selected to plot the students salary.
function [pt,as] = Plot_Average(AverageSalary,PartTime,yearin,selectedsalary,studentin2)

% Using hold on to plot this data on the student salary graph that occurs
% prior to this function being called.
hold on
 pt = plot(PartTime,'Year','Earnings','Marker','o');
 as = plot(AverageSalary,'Year','Earnings','Marker','square');
 grid

% Plots the exact year that the user selected on the graph with a red star.
 plot(yearin,selectedsalary,'r*')
 text(yearin,selectedsalary,'Selected Year','Color','r')

% Graph options.
 legend(studentin2,'Part Time','National Average','Location','best')
 xlabel('Year')
 ylabel('Salary (£)')
 title(studentin2,'Part Time and Average Salary in the UK','FontWeight','bold')
hold off
end