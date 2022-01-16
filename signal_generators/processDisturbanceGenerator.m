function [disturbance] = processDisturbanceGenerator(input)
    global ProcessDisturbance

    t = input(1);
    
    if(ProcessDisturbance.type == 1)
        if(t < ProcessDisturbance.step.time)
            disturbance = ProcessDisturbance.step.initialValue;
        else
            disturbance = ProcessDisturbance.step.finalValue;
        end
    elseif(ProcessDisturbance.type == 2)
        if(t > ProcessDisturbance.sine.startTime)
            disturbance = ProcessDisturbance.sine.amplitude*sin(ProcessDisturbance.sine.pulsation*t+ProcessDisturbance.sine.phase)+ProcessDisturbance.sine.bias;
        else
            disturbance = 0;
        end
    elseif(ProcessDisturbance.type == 3)
        if(t > 1 && t <= 2)
            disturbance = 0.05;
        elseif(t > 2 && t <=2.5)
            disturbance = -0.1 * t + 0.25;
        elseif(t > 2.5 && t < 3)
            disturbance = 0.1 * t - 0.25;
        elseif(t > 3 && t <= 4)
            a = 0.22;
            b = -1.05;
            c = 1.27;
            disturbance = a * (t-1) ^ 2 + b * (t-1) + c; 
        elseif(t > 4 && t < 5)
            disturbance = -7/121 * t ^ 3 + 461/1210 * t ^ 2 - 555/242;
        elseif(t > 5 && t <= 6)
            disturbance = 0.025 * sin(8 * pi * (t-4));
        else
            disturbance = 0;
        end
    elseif(ProcessDisturbance.type == 4)
        if(t > 1 && t <= 4)
            disturbance = 0.05;
        elseif(t > 4 && t <=8)
            disturbance = -0.1 * (t/4) + 0.25;
        elseif(t > 8 && t < 12)
            disturbance = 0.1 * (t/4) - 0.25;
        elseif(t > 3 && t <= 4)
            a = 0.22;
            b = -1.05;
            c = 1.27;
            disturbance = a * ((t/4)-1) ^ 2 + b * ((t/4)-1) + c; 
        elseif(t > 12 && t < 26)
            disturbance = -7/121 * (t/4) ^ 3 + 461/1210 * (t/4) ^ 2 - 555/242;
        elseif(t > 26 && t <= 30)
            disturbance = 0.025 * sin(8 * pi * (t-4));
        else
            disturbance = 0;
        end
    elseif(ProcessDisturbance.type == 5)
        if(t > ProcessDisturbance.sine.startTime)
            disturbance = ProcessDisturbance.doubleSine.amplitudeFirst * sin(ProcessDisturbance.doubleSine.pulsationFirst * t + ProcessDisturbance.doubleSine.phaseFirst)+...
                ProcessDisturbance.doubleSine.amplitudeSecond * sin(ProcessDisturbance.doubleSine.pulsationSecond *  t + ProcessDisturbance.doubleSine.phaseSecond)+...
                ProcessDisturbance.doubleSine.bias;
        else
            disturbance = 0;
        end
    end
end

