%% Sensor parameters
global Sensor
Sensor.noise.type = 0;       % Noise: 0 - off
                             %        1 - white noise
                             %        2 - gaussian noise

%% White noise parameters
Sensor.whiteNoise.power = 1e-13;  % Power of band-limited white noise
Sensor.whiteNoise.Ts = 0.001;     % Sampling time of noise
Sensor.whiteNoise.seed = 21000;

%% Gaussian noise parameters
Sensor.gaussianNoise.gain = 2e-4;
Sensor.gaussianNoise.meanValue = 0;
Sensor.gaussianNoise.variance = 1; 
Sensor.gaussianNoise.initialSeed = 41000;
Sensor.gaussianNoise.sampleTime = 0.001;

%% Quantization parameters
Sensor.quantization.enabled = 0;    % Quantization: 0 - off
                                    %               1 - on
Sensor.quantization.interval = 1e-2;

%% Sampling parameters
Sensor.sampling.enabled = 0;   % Sampling: 0 - off
                               %           1 - on
Sensor.sampling.rate = 0.001;