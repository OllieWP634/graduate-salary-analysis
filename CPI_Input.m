% Function with one or more input and output arguments.

% Function requires user input to determine whether a graph should be
% plotted for the CPI in the UK from 2007-2021.
function [cpimenu] = CPI_Input(CPI,CPI2,yearin)
cpimenu = menu('Would you like to also display the graph of CPI (Consumer Price Index) from 2007-2021?','Yes','Just display the selected years CPI in text','No');

% While loop used to reopen menu if it is closed by user.
while cpimenu == 0
cpimenu = menu('Would you like to also display the graph of CPI (Consumer Price Index) from 2007-2021?','Yes','Just display the selected years CPI in text','No');    
end

% if/elseif statement used to determine if a graph should be plotted based on the
% user input on line 4.
if cpimenu == 1

% Indexing to find the CPI that corresponds to the users year input, then
% printing it to the user.
fndcpi = CPI{:,1}==yearin;
selectedCPI = CPI{fndcpi,2};
fprintf('The CPI in the UK in %d averaged at %.1f%%\n',yearin,selectedCPI)

% Plotting the graph of CPI from 2007-2021.
figure(2)
movegui('center');
plot(CPI,'Year','CPI','Color','cyan');
 hold on

% Plotting a red star on the year that the user inputted on the CPI graph.
plot(yearin,selectedCPI,'r*');

% Graph options.
  text(yearin,selectedCPI,'Selected Year','Color','r')
  xlabel('Year')
  ylabel('CPI (%)')
  title('Consumer Price Index in the UK from 2007-2021')
 hold off

% Plotting CPI data for specified year that user inputted.
figure(3)
movegui('east');

% Indexing to find the CPI data for the year that the user inputted.
fndspeccpi = CPI2{:,1}==yearin;
[yCPI] = CPI2{fndspeccpi,:};

% Plotting the CPI data for the year that the user inputted against the 4
% quartiles of the year on the x axis.
yCPI(:,1) = [];
xCPI = [1 2 3 4];
Quartiles = {'Q4'; 'Q1'; 'Q2'; 'Q3';};
plot(xCPI,yCPI,'Marker','diamond','Color','magenta');
set(gca,'xtick',0:1:4,'xticklabel',Quartiles)
xlabel('Quartiles of the Year')
ylabel('CPI (%)')
title('CPI Data for:',yearin)

elseif cpimenu == 2
fndcpi = CPI{:,1}==yearin;
selectedCPI = CPI{fndcpi,2};
fprintf('The CPI in the UK in %d averaged at %.1f%%\n',yearin,selectedCPI)
end
end