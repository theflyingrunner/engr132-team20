function [vMax,kM] = lineweaverBurk(subConc,v_naught_sub_i)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function utilizes the provided dataset to do the following:
%   1. Parse the .csv to separate the reaction curve parameters for each
%   enzyme. In addition, it finds the mean of the test duplicates.
%   2. Perform linear regression for the first 20 seconds of reaction to
%   identify initial reaction rate. 
%   3. Generate reaction curves for all 5 enzymes
%   4. Generate noisy Micheles-Menten curve 
% To use the function, use command:
% [substrate_concentration, v_naught] = vNaught()
% This will create two variables in your workspace: one with substrate
% concentrations (uM) and another with tthe v0 [uM/s] for all 5 enzymes.
%
% Function Call
% vNaught()
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
%[subConc,v_naught_sub_i] = vNaught();
inv_subConc = 1./subConc;
inv_v_naught_sub_i = 1./v_naught_sub_i;
coeffs = zeros(5,2);
x_var = -0.01:0.001:0.275;
inv_v_naught_model = zeros(5,numel(x_var));



vMax = zeros(1,5);
kM = zeros(1,5);
%% ____________________
%% CALCULATIONS
for k = 1:5
coeffs(k,:) = polyfit(inv_subConc,inv_v_naught_sub_i(k,:),1);
inv_v_naught_model(k,:) = coeffs(k,1) .* x_var + coeffs(k,2);
vMax(1,k) = 1 / coeffs(k,2);
kM(1,k) = coeffs(k,1) * vMax(1,k);
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
figure(7)
plot(x_var,inv_v_naught_model(1,:), 'm-', 'LineWidth', 1)
grid on
hold on
plot(inv_subConc,inv_v_naught_sub_i(1,:), 'mo', 'LineWidth', 1)
plot(x_var,inv_v_naught_model(2,:), 'c-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(2,:), 'co', 'LineWidth', 1)
plot(x_var,inv_v_naught_model(3,:), 'g-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(3,:), 'go', 'LineWidth', 1)
plot(x_var,inv_v_naught_model(4,:), 'r-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(4,:), 'ro', 'LineWidth', 1)
plot(x_var,inv_v_naught_model(5,:), 'y-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(5,:), 'yo', 'LineWidth', 1)
line([0,0], ylim, 'Color', 'k', 'LineWidth', 1); % Draw line for Y axis.
line(xlim, [0,0], 'Color', 'k', 'LineWidth', 1); % Draw line for X axis.
title({'Lineweaver-Burk plots for all 5 NaturalCatalyst enzymes'})
xlabel('1/[S] [uM^-1]')
ylabel('1/V0 [s/uM]')
legend('Enzyme A: model','Enzyme A: data','Enzyme B','Enzyme B: data',...
    'Enzyme C','Enzyme C: data','Enzyme D','Enzyme D: data',...
    'Enzyme E','Enzyme E: data','y-axis','x-axis', 'Location', 'northwest')
axis([-0.01 0.0375 -3 14.5])
hold off 


%% ____________________
%% RESULTS


%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.
