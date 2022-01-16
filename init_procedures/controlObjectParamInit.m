global Plant

Plant.type = 4; % 1 - Simple transfer function
                % 2 - DCDC buck converter
                % 3 - Suspension ball
                % 4 - Transfer function time varying

%% Control object properties, G(s) = 1/(s+1)^2
Plant.transferFunction.A = [0 1;...
    -1 -2];
Plant.transferFunction.B = [0;1];
Plant.transferFunction.C = [1 0];
Plant.transferFunction.x0 = [0; 0]; % Initial conditions


%% DCDC buck converter
Vin = 20; % [V]
L = 0.01; % [H]
C = 0.001; % [F]
R = 50; % [Om]

Plant.dcdcBuckConverter.A = [-1 / (C * R), 1 / C;...
    -1 / L, 0];
Plant.dcdcBuckConverter.B = [0; Vin / L];
Plant.dcdcBuckConverter.C = [1 0];
Plant.dcdcBuckConverter.x0 = [0; 0]; % Initial conditions

%% Saturation of actuators
Plant.controlSignalSaturation.enabled = 0; % 0 - off 
                                           % 1 - on
Plant.controlSignalSaturation.upperLimit = 1;
Plant.controlSignalSaturation.lowerLimit = 0;