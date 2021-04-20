function M2_Algorithm_main_014_20
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ENGR 132 
% Program Description 
% This is the main function used to call the functions that will calculate
% the V0, Vmax, and kM values for the NaturalCatalysts enzymes
%
% Function Call
% [vMax,kM] = M2_Algorithm_lineweaverburk_014_20(subConc,v_naught_sub_i)
%
% Input Arguments
% None
%
% Output Arguments
% None
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


%% ____________________
%% CALCULATIONS
% first function call to find v0 values
[subConc,v_naught_sub_i] = M2_Algorithm_v0_014_20();
% second function call to calculate Vmax and kM
[vMax,kM] = M2_Algorithm_lineweaverburk_014_20(subConc,v_naught_sub_i); 
%% ____________________
%% FORMATTED TEXT/FIGURE DISPLAYS
% Format Vmax and kM data for enzymes as a table for display
T = array2table([vMax(1) kM(1); vMax(2) kM(2); vMax(3) kM(3); vMax(4) kM(4);...
    vMax(5) kM(5)],'VariableNames',{'Vmax [uM/s]', 'kM [uM]'},'RowName',{'Enzyme A',...
    'Enzyme B','Enzyme C','Enzyme D','Enzyme E'});
% Display kinetic parameter table
disp(T)

%% ____________________
%% RESULTS
%    Table 1: Comparison of Vmax and kM for all 5 enzymes
%
%                Vmax [uM/s]    kM [uM]
%                ___________    _______
%
%    Enzyme A       1.0006      153.21 
%    Enzyme B      0.76622      292.97 
%    Enzyme C       1.5082      226.85 
%    Enzyme D       1.6309      290.08 
%    Enzyme E       1.6171      148.95 
%
%% ____________________
%% ACADEMIC INTEGRITY STATEMENT
% We have not used source code obtained from any other unauthorized
% source, either modified or unmodified. Neither have we provided
% access to my code to another. The program we are submitting
% is our own original work.



