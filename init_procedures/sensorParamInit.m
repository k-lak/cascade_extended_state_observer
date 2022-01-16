%% Sensor parameters
global Sensor
Sensor.noise.type = 0;       % Noise: 0 - off
                             %        1 - white noise
                             
%% White noise parameters
Sensor.whiteNoise.power = 1e-8;  % Power of band-limited white noise
Sensor.whiteNoise.Ts = 0.001;     % Sampling time of noise
Sensor.whiteNoise.seed = 21000;