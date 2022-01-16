%% Observer type
global Observer
Observer.type = 1; % 1 - ESO
                   % 2 - GPIO, m=2
                   % 3 - GPIO, m=3
                   % 4 - GPIO, m=4
                   % 5 - CESO, p=2
                   % 6 - CESO, p=3
                   % 7 - CESO, p=4
                   % 8 - CESO, p=5

%% CESO Properties
global cascadedESO
alpha = 2; % Observer bandwidth scaling factor between cascade levels
w01 = 460/4; % Observer bandwidth of the first cascade level [rad/s]
w02 = alpha*w01; % Observer bandwidth of the second cascade level [rad/s]
w03 = alpha*w02; % Observer bandwidth of the third cascade level [rad/s]
w04 = alpha*w03; % Observer bandwidth of the fourth cascade level [rad/s]
w05 = alpha*w04; % Observer bandwidth of the fifth cascade level [rad/s]
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]'; % Gain vector for the first cascade level
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]'; % Gain vector for the second cascade level
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]'; % Gain vector for the third cascade level
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]'; % Gain vector for the fourth cascade level
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]'; % Gain vector for the fifth cascade level

%% ESO/GPIO Properties
global ESO
w0 = 400; % Observer bandwidth [rad/s]
ESO.w0 = w0;  
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]'; % Gain vector for ESO
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]'; % Gain vector for GPIO, m=2
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]'; % Gain vector for GPIO, m=3
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]'; % Gain vector for GPIO, m=4