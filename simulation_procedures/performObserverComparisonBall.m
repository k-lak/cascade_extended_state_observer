global Observer Sensor ProcessDisturbance ESO cascadedESO
init;

%% ESO n = 3
disp("ESOm, n=3");
Observer.type = 1;
Sensor.noise.enabled = 1;
ProcessDisturbance.enabled = 0;
w0 = 460;
ESO.w0 = w0;
ESO.gainVectorN3 = [3*w0, 3*w0^2, w0^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
logsoutEso = logsout;

%% CESO p = 2
disp("CESOm, p=2");
Observer.type = 9;
Sensor.noise.enabled = 1;
ProcessDisturbance.enabled = 0;
w01 = 460/6;
w02 = 6*w01;
cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
variantSystemsUpdate;
sim('ObserverTest.slx');
logsoutCesoP2 = logsout;

% %% CESO p = 3
% disp("CESOm, p=3");
% Observer.type = 10;
% Sensor.noise.enabled = 1;
% ProcessDisturbance.enabled = 0;
% w01 = 460/2.5^2;
% w02 = 2.5*w01;
% w03 = 2.5*w02;
% cascadedESO.gainVectorFirst = [3*w01, 3*w01^2, w01^3]';
% cascadedESO.gainVectorSecond = [3*w02, 3*w02^2, w02^3]';
% cascadedESO.gainVectorThird = [3*w03, 3*w03^2, w03^3]';
% variantSystemsUpdate;
% sim('ObserverTest.slx');
% logsoutCesoP3 = logsout;


% Output
h1 = figure;
subplot(2,2,1);
hold on;
grid on;
logsout = logsoutEso;
readLogsoutData;
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, y.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, y.Values.Data,'LineWidth',1.5);
end
logsout = logsoutCesoP2;
readLogsoutData;
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, y.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, y.Values.Data,'LineWidth',1.5);
end
% logsout = logsoutCesoP3;
% readLogsoutData;
% if(Sensor.quantization.enabled == 0)
%     plot(y.Values.Time, y.Values.Data,'LineWidth',1.5);
% else
%     stairs(y.Values.Time, y.Values.Data,'LineWidth',1.5);
% end
plot(t, refSig.Values.Data(:,1),'LineWidth',1.5);
title('Output');
legend('ESO, n=3','CESO, p=2','Desired')
xlabel('t[s]');
ylabel('y[m]');

% Error
subplot(2,2,2);
hold on;
grid on;
logsout = logsoutEso;
readLogsoutData;
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, e.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, e.Values.Data,'LineWidth',1.5);
end
logsout = logsoutCesoP2;
readLogsoutData;
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, e.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, e.Values.Data,'LineWidth',1.5);
end
% logsout = logsoutCesoP3;
% readLogsoutData;
% if(Sensor.quantization.enabled == 0)
%     plot(y.Values.Time, e.Values.Data,'LineWidth',1.5);
% else
%     stairs(y.Values.Time, e.Values.Data,'LineWidth',1.5);
% end
title('Control error');
legend('ESO, n=3','CESO, p=2')
xlabel('t[s]');
ylabel('e[m]');

% Control signal
subplot(2,2,3);
hold on;
grid on;
logsout = logsoutEso;
readLogsoutData;
plot(u.Values.Time,u.Values.Data,'LineWidth',1.5);
logsout = logsoutCesoP2;
readLogsoutData;
plot(u.Values.Time,u.Values.Data,'LineWidth',1.5);
% logsout = logsoutCesoP3;
% readLogsoutData;
% plot(u.Values.Time,u.Values.Data,'LineWidth',1.5);
title('Control signal');
legend('ESO, n=3','CESO, p=2')
xlabel('t[s]');
ylabel('u');

% Quality criteria
logsout = logsoutEso;
readLogsoutData;
IAEeso = sum(sqrt(e.Values.Data(1000:end).^2).*[diff(e.Values.Time(1000:end)); 0]);
ITAEeso = sum(sqrt(e.Values.Time(1000:end).*e.Values.Data(1000:end).^2).*[diff(e.Values.Time(1000:end)); 0]);
RMSEeso = sqrt(1/max(e.Values.Time(1000:end))*sum(((e.Values.Data(1000:end).^2)).*[diff(e.Values.Time(1000:end)); 0]));

logsout = logsoutCesoP2;
readLogsoutData;
IAEceso = sum(sqrt(e.Values.Data(1000:end).^2).*[diff(e.Values.Time(1000:end)); 0]);
ITAEceso = sum(sqrt(e.Values.Time(1000:end).*e.Values.Data(1000:end).^2).*[diff(e.Values.Time(1000:end)); 0]);
RMSEceso = sqrt(1/max(e.Values.Time(1000:end))*sum(((e.Values.Data(1000:end).^2)).*[diff(e.Values.Time(1000:end)); 0]));


a=annotation('textbox', [0.6 0.24 0.1 0.1], 'String', "$IAE_{ESO} = $ "+IAEeso);
set(a,'Interpreter','latex','EdgeColor','none');
a=annotation('textbox', [0.6 0.2 0.1 0.1], 'String', "$ITAE_{ESO} = $ "+ITAEeso);
set(a,'Interpreter','latex','EdgeColor','none');
a=annotation('textbox', [0.6 0.16 0.1 0.1], 'String', "$RMSE_{ESO} = $ "+RMSEeso);
set(a,'Interpreter','latex','EdgeColor','none');
a=annotation('textbox', [0.6 0.12 0.1 0.1], 'String',"$IAE_{CESO} = $"+IAEceso);
set(a,'Interpreter','latex','EdgeColor','none');
a=annotation('textbox', [0.6 0.08 0.1 0.1], 'String',"$ITAE_{CESO} = $"+ITAEceso);
set(a,'Interpreter','latex','EdgeColor','none');
a=annotation('textbox', [0.6 0.04 0.1 0.1], 'String',"$RMSE_{CESO} = $"+RMSEceso);
set(a,'Interpreter','latex','EdgeColor','none');

