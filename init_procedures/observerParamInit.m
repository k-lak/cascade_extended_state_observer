%% Observer type
global Observer
Observer.type = 1; % 1 - ESO, n=3
                   % 2 - ESO, n=4
                   % 3 - ESO, n=5
                   % 4 - ESO, n=6
                   % 5 - CESO, p=2
                   % 6 - CESO, p=3
                   % 7 - CESO, p=4
                   % 8 - CESO, p=5

%% CESO Properties
global cascadedESO
alpha = 2;
w01 = 460/4;
w02 = alpha*w01;
w03 = alpha*w02;
w04 = alpha*w03;
w05 = alpha*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';

%% ESO/GPIO Properties
global ESO
w0 = 400;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';