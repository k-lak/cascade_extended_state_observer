%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Krzysztof Lakomy, Rafal Madonski
% e-mail: adrc.toolbox@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Cascade extended state observer was described in detail in:
%
% [1] K. Lakomy, R. Madonski, Cascade extended state observer for 
%     active disturbance rejection control applications under measurement noise, 
%     ISA Transactions, Volume 109, 2021, Pages 1-10
%     Link: https://www.sciencedirect.com/science/article/pii/S0019057820303815
%
% [2] K. Lakomy, R. Madonski et al., Active Disturbance Rejection Control Design With 
%     Suppression of Sensor Noise Effects in Application to DC–DC Buck Power 
%     Converter, IEEE Transactions on Industrial Electronics, vol. 69(1), pp. 816-824
%     Link: https://ieeexplore.ieee.org/abstract/document/9345372

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