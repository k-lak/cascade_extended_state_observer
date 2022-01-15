%% ADRC Params
global Controller
Controller.adrc.inputMatrixEstimate = 1;%2e+06;
Controller.adrc.gainMatrix = [2^2 2*2];
Controller.deadTime.enabled = 0;
Controller.deadTime.time = 0.5;