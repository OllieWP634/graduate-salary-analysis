% Reading data from excel spreadsheets.
% PreserveVariableNames keeps code consistent to the excel file.
GraduateSalary = readtable('GraduateSalary.xlsx','PreserveVariableNames',true);
AverageSalary = readtable('AverageSalary.xlsx','PreserveVariableNames',true);
PartTime = readtable('PartTime.xlsx','PreserveVariableNames',true);
CPI = readtable('CPI.xlsx','PreserveVariableNames',true);
CPI2 = readtable('CPI2.xlsx','PreserveVariableNames',true);

% Calling textsequence, Year_Input, Student_Mean and CPI_Input functions to
% determine and analyse user input.
Title_Sequence;
yearin = Year_Input;
[studentin,studentin2,fndmean] = Student_Mean(GraduateSalary);

% Clears textsequence before displaying any results in the command window
% from CPI_Input
clc

% Calling CPI function to plot both CPI graphs and to print the CPI for the
% specified year if necessary.
[cpimenu] = CPI_Input(CPI,CPI2,yearin);

% Using find function to locate the exact salary that the user has
% selected, stored as the variable 'selectedsalary'.
fndsal = find(GraduateSalary{:,1}==yearin);
selectedsalary = GraduateSalary{fndsal,studentin2};

% Creating figure on left hand side of screen to display the salary plot.
figure(1)
movegui('west');

% if/elesif statement used to determine what graph should be plotted depending on
% the student type the user inputted.
if studentin == 1
studentinName = 'Graduate';

% Plotting the user selected salary on a graph from 2007-2021.
plot(GraduateSalary,'Year','Graduates');
 elseif studentin == 2
 studentinName = 'Post Graduate';
 plot(GraduateSalary,'Year','Postgraduates');
   elseif studentin == 3
   studentinName = 'Non Graduate';
   plot(GraduateSalary,'Year','Non-graduates')
end

% Calling plot1 function.
Plot_Average(AverageSalary,PartTime,yearin,selectedsalary,studentinName);

% Printing average data based on the users input at the start of the
% script.
fprintf('The average %s salary from 2007-2011 was £%.0f\n',studentinName,fndmean);
fprintf('The Average %s salary in %d was £%d\n',studentinName,yearin,selectedsalary);

% Clear function used to delete any stored data in the command window and the
% workspace.
clear