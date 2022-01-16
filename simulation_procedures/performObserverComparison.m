global Observer Sensor ProcessDisturbance ESO cascadedESO Plant Controller
init;
b_hat = Controller.adrc.inputGainEstimate;
B = Plant.transferFunction.B;
A = Plant.transferFunction.A;

gainMultiplier = 1/25;
%% ESO n = 3
disp("ESOm, n=3");
Observer.type = 1;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 100;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceESOn3 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatESOn3 = z_hat;

%% ESO n = 4
disp("ESOm, n=4");
Observer.type = 2;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 100;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceESOn4 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatESOn4 = z_hat;

%% ESO n = 5
disp("ESOm, n=5");
Observer.type = 3;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 100;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceESOn5 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatESOn5 = z_hat;

%% ESO n = 6
disp("ESOm, n=6");
Observer.type = 4;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w0 = 100;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
ESO.gainVectorN4 = [4*w0, 6*w0^2, 4*w0^3, w0^4]';
ESO.gainVectorN5 = [5*w0, 10*w0^2, 10*w0^3, 5*w0^4, w0^5]';
ESO.gainVectorN6 = [6*w0, 15*w0^2, 20*w0^3, 15*w0^4, 6*w0^5, w0^6]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceESOn6 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatESOn6 = z_hat;

%% CESO p = 2
disp("CESOm, p=2");
Observer.type = 5;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w01 = 100;
w02 = 2*w01;
w03 = 2*w02;
w04 = 2*w03;
w05 = 2*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceCESOp2 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatCESOp2 = z_hat;

%% CESO p = 3
disp("CESOm, p=3");
Observer.type = 6;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w01 = 100;
w02 = 2*w01;
w03 = 2*w02;
w04 = 2*w03;
w05 = 2*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceCESOp3 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatCESOp3 = z_hat;

%% CESO p = 4
disp("CESOm, p=4");
Observer.type = 7;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w01 = 100;
w02 = 2*w01;
w03 = 2*w02;
w04 = 2*w03;
w05 = 2*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceCESOp4 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatCESOp4 = z_hat;

%% CESO p = 5
disp("CESOm, p=5");
Observer.type = 8;
Sensor.noise.enabled = 0;
ProcessDisturbance.enabled = 1;
w01 = 100;
w02 = 2*w01;
w03 = 2*w02;
w04 = 2*w03;
w05 = 2*w04;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
cascadedESO.gainVectorFourth = [3*w04, 3*w04^2, w04^3]';
cascadedESO.gainVectorFifth = [3*w05, 3*w05^2, w05^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
readLogsoutData;
realDisturbanceCESOp5 = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
z_hatCESOp5 = z_hat;

%% Plot Observation error
h1 = figure;
hold on;
grid on;
plot(z_hatESOn3.Values.Time,z_hatESOn3.Values.Data(:,3)-realDisturbanceESOn3,'LineWidth',1.5);
plot(z_hatESOn4.Values.Time,z_hatESOn4.Values.Data(:,3)-realDisturbanceESOn4,'LineWidth',1.5);
plot(z_hatESOn5.Values.Time,z_hatESOn5.Values.Data(:,3)-realDisturbanceESOn5,'LineWidth',1.5);
plot(z_hatESOn6.Values.Time,z_hatESOn6.Values.Data(:,3)-realDisturbanceESOn6,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('\tilde{d}');
l = legend('ESO, $n=3$','ESO, $n=4$','ESO, $n=5$','ESO, $n=6$');
set(l,'Interpreter','latex')

%% Plot Observation error
h2 = figure;
hold on;
grid on;
plot(z_hatESOn3.Values.Time,z_hatESOn3.Values.Data(:,3)-realDisturbanceESOn3,'LineWidth',1.5);
plot(z_hatCESOp2.Values.Time,z_hatCESOp2.Values.Data(:,3)-realDisturbanceCESOp2,'LineWidth',1.5);
plot(z_hatCESOp3.Values.Time,z_hatCESOp3.Values.Data(:,3)-realDisturbanceCESOp3,'LineWidth',1.5);
plot(z_hatCESOp4.Values.Time,z_hatCESOp4.Values.Data(:,3)-realDisturbanceCESOp4,'LineWidth',1.5);
plot(z_hatCESOp5.Values.Time,z_hatCESOp5.Values.Data(:,3)-realDisturbanceCESOp5,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('\tilde{d}');
l = legend('ESO, $n=3$','CESO, $p=2$','CESO, $p=3$','CESO, $p=4$','CESO, $p=5$');
set(l,'Interpreter','latex')

%% Plot Observation error
h3 = figure;
hold on;
grid on;
plot(z_hatESOn4.Values.Time,z_hatESOn4.Values.Data(:,3)-realDisturbanceESOn4,'LineWidth',1.5);
plot(z_hatCESOp2.Values.Time,z_hatCESOp2.Values.Data(:,3)-realDisturbanceCESOp2,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('\tilde{d}');
l = legend('ESO, $n=4$','CESO, $p=2$');
set(l,'Interpreter','latex')

%% Plot Observation error
h4 = figure;
hold on;
grid on;
plot(z_hatESOn5.Values.Time,z_hatESOn5.Values.Data(:,3)-realDisturbanceESOn5,'LineWidth',1.5);
plot(z_hatCESOp3.Values.Time,z_hatCESOp3.Values.Data(:,3)-realDisturbanceCESOp3,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('\tilde{d}');
l = legend('ESO, $n=5$','CESO, $p=3$');
set(l,'Interpreter','latex')

%% Plot Observation error
h5 = figure;
hold on;
grid on;
plot(z_hatESOn6.Values.Time,z_hatESOn6.Values.Data(:,3)-realDisturbanceESOn6,'LineWidth',1.5);
plot(z_hatCESOp4.Values.Time,z_hatCESOp4.Values.Data(:,3)-realDisturbanceCESOp4,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('\tilde{d}');
l = legend('ESO, $n=6$','CESO, $p=4$');
set(l,'Interpreter','latex')

%% Plot FFT
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
lESOn3 = numel(z_hatESOn3.Values.Time);             % Length of signal
lCESOp2 = numel(z_hatCESOp2.Values.Time);             % Length of signal
lCESOp3 = numel(z_hatCESOp3.Values.Time);             % Length of signal
lCESOp4 = numel(z_hatCESOp4.Values.Time);             % Length of signal
lCESOp5 = numel(z_hatCESOp5.Values.Time);             % Length of signal
tESOn3 = (0:lESOn3-1)*T;        % Time vector
tCESOp2 = (0:lCESOp2-1)*T;        % Time vector
tCESOp3 = (0:lCESOp3-1)*T;        % Time vector
tCESOp4 = (0:lCESOp4-1)*T;        % Time vector
tCESOp5 = (0:lCESOp5-1)*T;        % Time vector

yESOn3 = fft(z_hatESOn3.Values.Data(:,3)-realDisturbanceESOn3);
P2ESOn3 = abs(yESOn3/lESOn3);
P1ESOn3 = P2ESOn3(1:lESOn3/2+1);
P1ESOn3(2:end-1) = 2*P1ESOn3(2:end-1);

yCESOp2 = fft(z_hatCESOp2.Values.Data(:,3)-realDisturbanceCESOp2);
P2CESOp2 = abs(yCESOp2/lCESOp2);
P1CESOp2 = P2CESOp2(1:lCESOp2/2+1);
P1CESOp2(2:end-1) = 2*P1CESOp2(2:end-1);

yCESOp3 = fft(z_hatCESOp3.Values.Data(:,3)-realDisturbanceCESOp3);
P2CESOp3 = abs(yCESOp3/lCESOp3);
P1CESOp3 = P2CESOp3(1:lCESOp3/2+1);
P1CESOp3(2:end-1) = 2*P1CESOp3(2:end-1);

yCESOp4 = fft(z_hatCESOp4.Values.Data(:,3)-realDisturbanceCESOp4);
P2CESOp4 = abs(yCESOp4/lCESOp4);
P1CESOp4 = P2CESOp4(1:lCESOp4/2+1);
P1CESOp4(2:end-1) = 2*P1CESOp4(2:end-1);

yCESOp5 = fft(z_hatCESOp5.Values.Data(:,3)-realDisturbanceCESOp5);
P2CESOp5 = abs(yCESOp5/lCESOp5);
P1CESOp5 = P2CESOp5(1:lCESOp5/2+1);
P1CESOp5(2:end-1) = 2*P1CESOp5(2:end-1);

fESOn3 = Fs*(0:(lESOn3/2))/lESOn3;
fCESOp2 = Fs*(0:(lCESOp2/2))/lCESOp2;
fCESOp3 = Fs*(0:(lCESOp3/2))/lCESOp3;
fCESOp4 = Fs*(0:(lCESOp4/2))/lCESOp4;
fCESOp5 = Fs*(0:(lCESOp5/2))/lCESOp5;

h6 = figure;
hold on;
grid on;
plot(fESOn3,P1ESOn3,'LineWidth',1.5) 
plot(fCESOp2,P1CESOp2,'LineWidth',1.5)
plot(fCESOp3,P1CESOp3,'LineWidth',1.5)
plot(fCESOp4,P1CESOp4,'LineWidth',1.5)
plot(fCESOp5,P1CESOp5,'LineWidth',1.5) 
title('Frequency spectrum of total disturbance observation error');
xlabel('f[Hz[');
ylabel('-');
l = legend('ESO, $n=3$','CESO, $p=2$','CESO, $p=3$','CESO, $p=4$','CESO, $p=5$');
set(l,'Interpreter','latex')