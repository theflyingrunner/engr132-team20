function [vMax,kM] = M2_Algorithm_lineweaverburk_014_20(subConc,v_naught_sub_i)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This function utilizes the v0 calculated in vNaught() to:
% 1. calculate and return Vmax and kM for the 5 enzymes using the 
%    Lineweaver-Burk model
% 2. display the Lineweaver-Burk plot representing all five enzymes
% Function Call
% [vMax,kM] = M2_Algorithm_lineweaverburk_014_20(subConc,v_naught_sub_i)
%
% Input Arguments
% subConc: substrate concentration [uM]
% v_naught_sub_i: initial reaction rate [uM/s]
%
% Output Arguments
% Vmax: maximum reaction velocity for a given enzyme [uM/s]
% kM: Micheles-Menten constant, it's the substrate concentration at which
% the reaction velocity is half Vmax [uM]
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
inv_subConc = 1./subConc;                   % inverse of the substrate concentration [1/uM]
inv_v_naught_sub_i = 1./v_naught_sub_i;     % inverse of the initial reaction rate [s/uM]
coeffs = zeros(5,2);                        % matrix of linear regression parameters
x_var = -0.01:0.001:0.275;                  % 1/[S] range for model
inv_v_naught_model = zeros(5,numel(x_var)); % matrix of v0 model
vMax = zeros(1,5);                          % vector of Vmax for all five enzymes
kM = zeros(1,5);                            % vector of kM for all five enzymes
%% ____________________
%% CALCULATIONS

% For loop to perform linear regression on the 1/v0 and 1/[S] data to
% produce linear regression coefficients for Lineweaver-Burk Plot
% slope = kM/Vmax
% y-intercept = Vmax
for k = 1:5
coeffs(k,:) = polyfit(inv_subConc,inv_v_naught_sub_i(k,:),1);
inv_v_naught_model(k,:) = coeffs(k,1) .* x_var + coeffs(k,2);
vMax(1,k) = 1 / coeffs(k,2);
kM(1,k) = coeffs(k,1) * vMax(1,k);
end

%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% creating RGB color triplets for use in plots below
blue = [0, 0.4470, 0.7410];
orange = [0.8500, 0.3250, 0.0980];
purple = [0.4940, 0.1840, 0.5560];
green = [0.4660, 0.6740, 0.1880];
red = [0.6350, 0.0780, 0.1840];
% Plot of Lineweaver-Burk
figure(7)
plot(x_var,inv_v_naught_model(1,:), 'Color', blue, 'LineStyle', '-', 'LineWidth', 1)
grid on
hold on
plot(inv_subConc,inv_v_naught_sub_i(1,:), 'LineStyle', 'none', 'Marker', 'o', 'MarkerFaceColor', blue, 'MarkerEdgeColor', blue)
plot(x_var,inv_v_naught_model(2,:), 'Color', orange, 'LineStyle', '-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(2,:), 'LineStyle', 'none', 'Marker', 'o', 'MarkerFaceColor', orange, 'MarkerEdgeColor', orange)
plot(x_var,inv_v_naught_model(3,:), 'Color', purple, 'LineStyle', '-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(3,:), 'LineStyle', 'none', 'Marker', 'o', 'MarkerFaceColor', purple, 'MarkerEdgeColor', purple)
plot(x_var,inv_v_naught_model(4,:), 'Color', green, 'LineStyle', '-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(4,:), 'LineStyle', 'none', 'Marker', 'o', 'MarkerFaceColor', green, 'MarkerEdgeColor', green)
plot(x_var,inv_v_naught_model(5,:), 'Color', red, 'LineStyle', '-', 'LineWidth', 1)
plot(inv_subConc,inv_v_naught_sub_i(5,:), 'LineStyle', 'none', 'Marker', 'o', 'MarkerFaceColor', red, 'MarkerEdgeColor', red)
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
