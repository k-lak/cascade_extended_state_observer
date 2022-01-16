%% Reference signal
global RefSig
RefSig.type = 1;  % Type of reference signal: 1 - step
                  %                           2 - sine wave 
                  %                           3 - pulse
                  
%% For constant value: refSig = k
RefSig.step.time = 0.2; % step time [s]
RefSig.step.initialValue = 0;
RefSig.step.finalValue = 1;

%% For sine wave: refSig = A*sin(w*t+phi)
RefSig.sine.amplitude = 1;
RefSig.sine.pulsation = 3.14; % [rad/s]
RefSig.sine.bias = 0;
RefSig.sine.phase = 0;

%% For pulse wave:
RefSig.pulse.lowValue = 5;
RefSig.pulse.highValue = 15;
RefSig.pulse.period = 1; %[s]
RefSig.pulse.width = 0.5; % in [0,1]

%% Reference filtering
RefSig.filter.numerator = 1;
RefSig.filter.denominator = [0.1^5 5*0.1^4 10*0.1^3 10*0.1^2 5*0.1 1];