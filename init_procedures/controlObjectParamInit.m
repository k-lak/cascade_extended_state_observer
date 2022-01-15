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

%% Suspension ball
m = 0.094;
miu0 = 4*pi*10^(-7);
A = pi*10^(-4);
N = 2450;
i0 = 0.3943;
x0 = 0.01;
Ka = 6.508;
Plant.suspensionBall.L = N^2*miu0*A/2;
Plant.suspensionBall.K1 = miu0*N^2*i0*A/(m*2*x0^2*Ka);
Plant.suspensionBall.K2 = miu0*N^2*i0^2*A/(m*2*x0^3);
Plant.suspensionBall.x0 = [-10.02/1000 0 0];

%% Maglev suspension
Plant.maglevSuspension.Ms = 1000;
Plant.maglevSuspension.Kb = 0.0015;
Plant.maglevSuspension.Kf = 9810;
Plant.maglevSuspension.Rc = 10;
Plant.maglevSuspension.g = 9.81;
Plant.maglevSuspension.Lc = 0.1;
Plant.maglevSuspension.Nc = 2000;
Plant.maglevSuspension.Ap = 0.01;
Plant.maglevSuspension.x0 = [10;0;0.015];

%% Saturation of actuators
Plant.controlSignalSaturation.enabled = 0; % 0 - off 
                                           % 1 - on
Plant.controlSignalSaturation.upperLimit = 1;
Plant.controlSignalSaturation.lowerLimit = 0;