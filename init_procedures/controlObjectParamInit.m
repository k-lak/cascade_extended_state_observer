global Plant

Plant.type = 1; % 1 - Simple transfer function
                % 2 - DCDC buck converter
                % 3 - Transfer function time varying

%% Control object properties, G(s) = 1/(s+1)^2
Plant.transferFunction.A = [0 1;...
    -1 -2]; % State matrix
Plant.transferFunction.B = [0;1]; % Input matrix
Plant.transferFunction.C = [1 0]; % Output matrix
Plant.transferFunction.x0 = [0; 0]; % Initial conditions


%% DCDC buck converter
Vin = 20; % Source voltage [V]
L = 0.01; % Inductance [H]
C = 0.001; % Capacitance [F]
R = 50; % Resistance [Om]

Plant.dcdcBuckConverter.A = [-1 / (C * R), 1 / C;...
    -1 / L, 0]; % State matrix
Plant.dcdcBuckConverter.B = [0; Vin / L]; % Input matrix
Plant.dcdcBuckConverter.C = [1 0]; % Output matrix
Plant.dcdcBuckConverter.x0 = [0; 0]; % Initial conditions

%% Saturation of actuators
Plant.controlSignalSaturation.enabled = 0; % 0 - off 
                                           % 1 - on
Plant.controlSignalSaturation.upperLimit = 1;
Plant.controlSignalSaturation.lowerLimit = 0;