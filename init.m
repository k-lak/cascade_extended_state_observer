%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Author: Krzysztof Lakomy, Rafal Madonski
%% e-mail: adrc.toolbox@gmail.com
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

addpath('plant',...
        'observers',...
        'data_analysis',...
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