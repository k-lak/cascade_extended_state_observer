%% Disturbances
global ProcessDisturbance
ProcessDisturbance.enabled = 1; % Disturbance: 0 -off
                         %              1 - on
                         
ProcessDisturbance.type = 2;  % Type of disturbance: 1 - step value
                       %                             2 - sine wave 
                       %                             3 - different
                       %                             disturbances
                       %                             4 - same as 3 bat
                       %                             scaled in time
                       %                             5 - rectangular pulse
                       %                             6 - double sine
% For step value:
ProcessDisturbance.step.time = 3.5;
ProcessDisturbance.step.initialValue = 0;
ProcessDisturbance.step.finalValue = 2.0;
% For sine wave:
ProcessDisturbance.sine.startTime = 3.5;
ProcessDisturbance.sine.amplitude = 5;
ProcessDisturbance.sine.bias = 0.00;
ProcessDisturbance.sine.pulsation = 9;
ProcessDisturbance.sine.phase = 0;

% For double sine wave:
ProcessDisturbance.doubleSine.startTime = 3.5;
ProcessDisturbance.doubleSine.amplitudeFirst = 0.3;
ProcessDisturbance.doubleSine.amplitudeSecond = 0.5;
ProcessDisturbance.doubleSine.bias = 0.00;
ProcessDisturbance.doubleSine.pulsationFirst = 15;
ProcessDisturbance.doubleSine.pulsationSecond = 30;
ProcessDisturbance.doubleSine.phaseFirst = 0;
ProcessDisturbance.doubleSine.phaseSecond = pi/2;

global OutputDisturbance
OutputDisturbance.enabled = 0; % Disturbance: 0 -off
                         %              1 - on
                         
OutputDisturbance.type = 2;  % Type of disturbance: 1 - step value
                       %                      2 - sine wave 
% For step value:
OutputDisturbance.step.time = 5;
OutputDisturbance.step.initialValue = 0;
OutputDisturbance.step.finalValue = 2.0;
% For sine wave:
OutputDisturbance.sine.startTime = 5;
OutputDisturbance.sine.amplitude = 0.5;
OutputDisturbance.sine.pulsation = 15;
OutputDisturbance.sine.phase = 0;