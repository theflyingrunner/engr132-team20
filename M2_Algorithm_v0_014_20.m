function [subConc,v_naught_sub_i] = M2_Algorithm_v0_014_20()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function utilizes the provided dataset to do the following:
%   1. Parse the .csv to separate the reaction curve parameters for each
%   enzyme. In addition, it finds the mean of the test duplicates.
%   2. Perform linear regression for the first 20 seconds of reaction to
%   identify initial reaction rate. 
%   3. Generate reaction curves for all 5 enzymes [figs. 1-5]
%   4. Generate noisy Micheles-Menten curve [fig. 6]
% To use the function, use command:
% [substrate_concentration, v_naught] = vNaught()
% This will create two variables in your workspace: one with substrate
% concentrations (uM) and another with tthe v0 [uM/s] for all 5 enzymes.
%
% Function Call
% [subConc,v_naught_sub_i] = M2_Algorithm_v0_014_20()
%
% Input Arguments
% None
%
% Output Arguments
% [substrate_concentration, v_naught] 
%
% Assignment Information
%   Assignment:     M2 
%   Team member:    Saron Bhoopathy, sbhoopat@purdue.edu
%                   Jack Likens, likens2@purdue.edu
%                   Jeremiah Monteiro, monteiro@purdue.edu
%                   Christian Boshoven, cboshoven@purdue.edu
%   Team ID:        014-20
%   Academic Integrity:
%     [x] We worked with one or more peers but our collaboration
%        maintained academic integrity.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ____________________
%% INITIALIZATION
% readmatrix to create a matrix of data file
rawData = readmatrix('Data_nextGen_KEtesting_allresults.csv');

% substrate concentration values [uM]
subConc = rawData(1,2:11);
% time values [s]
time = rawData(3:7486,1);

% separation of test data for different enzymes
% duplicates are first separated into 1 and 2
% then the average of the data is found

% test data for enzyme A
enzymeA1 = rawData(3:7486,2:11);
enzymeA2 = rawData(3:7486,12:21);
enzymeA = (enzymeA1+enzymeA2)./2;
% test data for enzyme B
enzymeB1 = rawData(3:7486,22:31);
enzymeB2 = rawData(3:7486,32:41);
enzymeB = (enzymeB1+enzymeB2)./2;
% test data for enzyme C
enzymeC1 = rawData(3:7486,42:51);
enzymeC2 = rawData(3:7486,52:61);
enzymeC = (enzymeC1+enzymeC2)./2;
% test data for enzyme D
enzymeD1 = rawData(3:7486,62:71);
enzymeD2 = rawData(3:7486,72:81);
enzymeD = (enzymeD1+enzymeD2)./2;
% test data for enzyme E
enzymeE1 = rawData(3:7486,82:91);
enzymeE2 = rawData(3:7486,92:101);
enzymeE = (enzymeE1+enzymeE2)./2;

v_naught_sub_i = zeros(5,10);
%% ____________________
%% CALCULATIONS

% Calculating v_naught_sub_i i.e. the initial reaction rate at different
% substrate concentrations are each enzyme
% A linear regression model is generated for 0-20 s of the reaction to
% smoothen potential noise in the data. Now, v_naught is calculated using
% the slope of the linear regression model.
% Enzyme A
for substrateLoop = 1:10
    coeffs = polyfit(time(1:21),enzymeA(1:21,substrateLoop),1);
    v_naught_sub_i(1,substrateLoop) = coeffs(1);
end
% Enzyme B
for substrateLoop = 1:10
    coeffs = polyfit(time(1:21),enzymeB(1:21,substrateLoop),1);
    v_naught_sub_i(2,substrateLoop) = coeffs(1);
end
% Enzyme C
for substrateLoop = 1:10
    coeffs = polyfit(time(1:21),enzymeC(1:21,substrateLoop),1);
    v_naught_sub_i(3,substrateLoop) = coeffs(1);
end
% Enzyme D
for substrateLoop = 1:10
    coeffs = polyfit(time(1:21),enzymeD(1:21,substrateLoop),1);
    v_naught_sub_i(4,substrateLoop) = coeffs(1);
end
% Enzyme E
for substrateLoop = 1:10
    coeffs = polyfit(time(1:21),enzymeE(1:21,substrateLoop),1);
    v_naught_sub_i(5,substrateLoop) = coeffs(1);
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% Plot set 1/2
% Product Concentration [uM] vs. time [s] graphs for all 5 enzymes
% This will help in identifying the slope to determine initial reaction
% rate
% Enzyme A
figure(1)
plot(time,enzymeA(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'Enzyme A: variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeA(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
axis([0 1000 0 250])
hold off
% Enzyme B
figure(2)
plot(time,enzymeB(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'Enzyme B: variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeB(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
axis([0 1000 0 250])
hold off
% Enzyme C
figure(3)
plot(time,enzymeC(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'Enzyme C: variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeC(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
axis([0 1000 0 250])
hold off
% Enzyme D
figure(4)
plot(time,enzymeD(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'Enzyme D: variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeD(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
axis([0 1000 0 250])
hold off
% Enzyme E
figure(5)
plot(time,enzymeE(:,1))
xlabel('time [s]')
ylabel('product concentration [uM]')
title({'Enzyme E: variation of product concentration with time',...
    'at different substrate concentrations'})
grid on
hold on
for k = 2:10
    plot(time, enzymeE(:,k))
end
lgd = legend('S1: 3.75','S2: 7.5','S3: 15','S4: 30','S5: 65','S6: 125','S7: 250','S8: 500','S9: 1000', 'S10: 2000');
lgd.Title.String = 'Substrate Concentration [uM]';
axis([0 1000 0 250])
hold off

% Plot set 2/2
% Micheles-Menten curve of vNaught [uM/s]vs. substrate concentration [uM] 
% Enzyme A
figure(6)
subplot(3,2,1)
plot(subConc(1,:),v_naught_sub_i(1,:))
grid on
xlabel('[S](uM)')
ylabel('v0 (uM/s)')
title('Enzyme A')
% Enzyme B
subplot(3,2,2)
plot(subConc(1,:),v_naught_sub_i(2,:))
grid on
xlabel('[S](uM)')
ylabel('v0 (uM/s)')
title('Enzyme B')
% Enzyme C
subplot(3,2,3)
plot(subConc(1,:),v_naught_sub_i(3,:))
grid on
xlabel('[S](uM)')
ylabel('v0 (uM/s)')
title('Enzyme C')
% Enzyme D
subplot(3,2,4)
plot(subConc(1,:),v_naught_sub_i(4,:))
grid on
xlabel('[S](uM)')
ylabel('v0 (uM/s)')
title('Enzyme D')
% Enzyme E
subplot(3,2,5)
plot(subConc(1,:),v_naught_sub_i(5,:))
grid on
xlabel('[S](uM)')
ylabel('v0 (uM/s)')
title('Enzyme E')
% Subplot formatting 
h(1) = subplot(3,2,1);
h(2) = subplot(3,2,2);
h(3) = subplot(3,2,3);
h(4) = subplot(3,2,4);
h(5) = subplot(3,2,5); % the last (odd) axes
pos = get(h,'Position');
new = mean(cellfun(@(v)v(1),pos(1:2)));
set(h(5),'Position',[new,pos{end}(2:end)])
sgtitle({'Micheles-Menten Curve of Initial Reaction Rate [uM/s]',...
    'varying with Substrate Concentration [uM] for the Five Enzymes'})
%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



