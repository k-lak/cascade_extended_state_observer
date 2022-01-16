%% ADRC parameters
global Controller
Controller.adrc.inputGainEstimate = 1;
Controller.adrc.wc = 2; % Controller bandwidth [rad/s]
Controller.adrc.gainMatrix = [Controller.adrc.wc^2, Controller.adrc.wc*2];
Controller.deadTime.enabled = 0;
Controller.deadTime.time = 0.5;