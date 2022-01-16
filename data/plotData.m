global Controller Plant RefSig Sensor
b_hat = Controller.adrc.inputGainEstimate;

if(Plant.type == 1)
    B = Plant.transferFunction.B;
    A = Plant.transferFunction.A;
elseif(Plant.type == 2)
    B = Plant.dcdcBuckConverter.B;
    A = Plant.dcdcBuckConverter.A;
else
    B = Plant.transferFunction.B;
    A = Plant.transferFunction.A;
end

readLogsoutData;

% Plot data
h1 = figure;

%% Output
subplot(3,2,1);
hold on;
grid on;
tunnelPercentage = 5;
if(RefSig.type == 1)
    tunnel = tunnelPercentage/100*abs(RefSig.step.finalValue-RefSig.step.initialValue);
elseif(RefSig.type == 2)
    tunnel = tunnelPercentage/100*RefSig.sine.amplitude;
else
    tunnel = 0;
end
plot(y_qstar.Values.Time, y_tstar.Values.Data(:,1),'LineWidth',1.5);
plot(z_hat.Values.Time, -z_hat.Values.Data(:,1)+refSig.Values.Data,'LineWidth',1.5);
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, y.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, y.Values.Data,'LineWidth',1.5);
end
plot(t, refSig.Values.Data(:,1),'LineWidth',1.5);
plot(t, refSig.Values.Data(:,1)+tunnel,'--','Color',[.8 .5 .5],'LineWidth',1.5);
plot(t, refSig.Values.Data(:,1)-tunnel,'--','Color',[.8 .5 .5],'LineWidth',1.5);
title('Output');
legend('Clear','Estimated','Measured','Desired')
xlabel('t[s]');
ylabel('y');

%% Error
subplot(3,2,2);
hold on;
grid on;
plot(x.Values.Time, refSig.Values.Data-y_tstar.Values.Data(:,1),'LineWidth',1.5);
plot(t, z_hat.Values.Data(:,1),'LineWidth',1.5);
if(Sensor.quantization.enabled == 0)
    plot(y.Values.Time, e.Values.Data,'LineWidth',1.5);
else
    stairs(y.Values.Time, e.Values.Data,'LineWidth',1.5);
end
title('Control error');
legend('Clear','Estimated','Measured')
xlabel('t[s]');
ylabel('e');

%% Disturbance
subplot(3,2,3);
hold on;
grid on;
if(Plant.type == 4)
    g = (1+0.2*tanh((x.Values.Time-2)))./(abs(x.Values.Data(:,1))+1);
    realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - g).*u.Values.Data-g.*dp.Values.Data;
else
    realDisturbance = refSigSecondDerivative.Values.Data-(A(2,:)*(x.Values.Data(:,1:2))')'+(b_hat - B(2,:))*u.Values.Data-B(2,:)*dp.Values.Data;
end
plot(xp.Values.Time, realDisturbance,'LineWidth',1.5);
plot(z_hat.Values.Time, z_hat.Values.Data(:,3),'LineWidth',1.5);
title('Total disturbance');
legend('Real','Estimated')
xlabel('t[s]');
ylabel('d');

%% Observation error
subplot(3,2,4);
hold on;
grid on;
plot(e.Values.Time,z_hat.Values.Data(:,1)-refSig.Values.Data+x.Values.Data(:,1),'LineWidth',1.5);
plot(z_hat.Values.Time,z_hat.Values.Data(:,2)-refSigDerivative.Values.Data+x.Values.Data(:,2),'LineWidth',1.5);
plot(z_hat.Values.Time,z_hat.Values.Data(:,3)-realDisturbance,'LineWidth',1.5);
title('Observation errors');
xlabel('t[s]');
ylabel('-');
l = legend('$\tilde{z}_1$','$\tilde{z}_2$','$\tilde{z}_3$');
set(l,'Interpreter','latex')

%% Control signal
subplot(3,2,5);
hold on;
grid on;
plot(u.Values.Time,u.Values.Data,'LineWidth',1.5);
title('Control signal');
xlabel('t[s]');
ylabel('u');