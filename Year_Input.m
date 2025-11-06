% Function with one or more output arguments.

% Used to determine the year that the user wishes to analyse throughout the
% main script.
function yearin = Year_Input
yearin = input('Please select a year between 2007 and 2021:\n');

% While loop used to check the year input, if the inputted year is outside
% of the range, an error message is displayed.
while (yearin < 2007) || (yearin > 2021)
yearin = input('That year isn''t in the data set. Please select a year between 2007 and 2021:\n');
end

end