%function velocityFunction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function does v naught calculations
%
% Function Call
% replace this text with a comment that states the function call
%
% Input Arguments
% replace this text with a commented list of the input arguments
%
% Output Arguments
% replace this text with a commented list of the output arguments
%
% Assignment Information
%   Assignment:     M2, Problem #
%   Team member:    Saron Bhoopathy, sbhoopat@purdue.edu
%                   Jack Likens, likens2@purdue.edu
%                   Jeremiah Monteiro, monteiro@purdue.edu
%                   Christian Boshoven, cboshoven@purdue.edu
%   Team ID:        014-20
%   Academic Integrity:
%     [] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%     Peers we worked with: Name, login@purdue [repeat for each]
% did you complete the assignment information? delete this line if yes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
rawData = readmatrix('Data_nextGen_KEtesting_allresults.csv');

subConc = rawData(1,2:11);
time = rawData(3:7486,1);

enzymeA1 = rawData(3:7486,2:11);
enzymeA2 = rawData(3:7486,12:21);
enzymeA = (enzymeA1+enzymeA2)./2;

enzymeB1 = rawData(3:7486,22:31);
enzymeB2 = rawData(3:7486,32:41);
enzymeB = (enzymeB1+enzymeB2)./2;

enzymeC1 = rawData(3:7486,42:51);
enzymeC2 = rawData(3:7486,52:61);
enzymeC = (enzymeC1+enzymeC2)./2;

enzymeD1 = rawData(3:7486,62:71);
enzymeD2 = rawData(3:7486,72:81);
enzymeD = (enzymeD1+enzymeD2)./2;

enzymeE1 = rawData(3:7486,82:91);
enzymeE2 = rawData(3:7486,92:101);
enzymeE = (enzymeE1+enzymeE2)./2;

%% ____________________
%% CALCULATIONS


%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(1)
plot(time,enzymeA(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeA(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
hold off

figure(2)
plot(time,enzymeB(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeB(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
hold off

figure(3)
plot(time,enzymeC(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeC(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
hold off

figure(4)
plot(time,enzymeD(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeD(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
hold off

figure(5)
plot(time,enzymeE(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeE(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
hold off
%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



