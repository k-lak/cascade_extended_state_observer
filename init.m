%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Cascade Extended State Observer (CESO)
% Authors: Krzysztof Lakomy, Rafal Madonski
% E-mail: adrc.toolbox@gmail.com
% Date: January, 2022
% License: MIT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cascade Extended State Observer (CESO) was described in detail in:
%
% [1] K. Lakomy, R. Madonski, Cascade extended state observer for 
%     active disturbance rejection control applications under measurement noise, 
%     ISA Transactions, vol. 109, pp. 1-10, 2021
%     Link: https://www.sciencedirect.com/science/article/pii/S0019057820303815
%
% [2] K. Lakomy, R. Madonski et al., Active Disturbance Rejection Control Design With 
%     Suppression of Sensor Noise Effects in Application to DC–DC Buck Power 
%     Converter, IEEE Transactions on Industrial Electronics, vol. 69, no.
%     1, pp. 816-824, 2022
%     Link: https://ieeexplore.ieee.org/abstract/document/9345372

%% Are you new to Active Disturbance Rejection Control (ADRC)? 
%
% Check out our 'ADRC Toolbox' for MATLAB/Simulink. You will find it at:
% https://www.mathworks.com/matlabcentral/fileexchange/102249-active-disturbance-rejection-control-adrc-toolbox

%% Initialization

clear;
close all;
clc;

addpath('plant',...
        'observers',...
        'data',...
        'controller',...
        'signal_generators',...
        'math',...
        'simulation_procedures',...
        'init_procedures');
    
simulationParamInit;
referenceSignalParamInit;
observerParamInit;
controllerParamInit;
disturbanceParamInit;
controlObjectParamInit;
sensorParamInit;
variantSystemsUpdate;