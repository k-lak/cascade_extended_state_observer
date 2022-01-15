function [disturbance] = output_disturbance_generator(input)
    global OutputDisturbance

    t = input(1);
    
    if(OutputDisturbance.type == 1)
        if(t < OutputDisturbance.step.time)
            disturbance = OutputDisturbance.step.initialValue;
        else
            disturbance = OutputDisturbance.step.finalValue;
        end
    elseif(OutputDisturbance.type == 2)
        if(t > OutputDisturbance.sine.startTime)
            disturbance = OutputDisturbance.sine.amplitude*sin(OutputDisturbance.sine.pulsation*t+OutputDisturbance.sine.phase);
        else
            disturbance = 0;
        end
    end
end

