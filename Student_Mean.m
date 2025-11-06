% Function with one or more input and output arguments.

% Opens a menu, allowing user to decide which student salary they wish to
% analyse.
function [studentin,studentin2,fndmean] = Student_Mean(GraduateSalary)
studentin = menu('Select a student type:','Graduate','Post Graduate','Non Graduate');

% While loop used to reopen menu if it is closed by user.
while studentin == 0
studentin = menu('Select a student type:','Graduate','Post Graduate','Non Graduate');
end

% Some Statistical/Data analysis.
studentin2 = studentin + 1;
fndmean = mean(GraduateSalary{:, studentin2});

end