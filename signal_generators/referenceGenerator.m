function [out] = referenceGenerator(input)
    global RefSig

    t = input(1);
    
    if(RefSig.type == 1)
        if(t < RefSig.step.time)
            refSig = RefSig.step.initialValue;
        else
            refSig = RefSig.step.finalValue;
        end
        refSigDerivative = 0;
        refSigSecondDerivative = 0;
        refSigThirdDerivative = 0;
    elseif(RefSig.type == 2)
        refSig = RefSig.sine.amplitude*sin(RefSig.sine.pulsation*t+RefSig.sine.phase)+RefSig.sine.bias;
        refSigDerivative = RefSig.sine.amplitude*RefSig.sine.pulsation*cos(RefSig.sine.pulsation*t+RefSig.sine.phase);
        refSigSecondDerivative = -RefSig.sine.amplitude*RefSig.sine.pulsation^2*sin(RefSig.sine.pulsation*t+RefSig.sine.phase);;
        refSigThirdDerivative = -RefSig.sine.amplitude*RefSig.sine.pulsation^3*cos(RefSig.sine.pulsation*t+RefSig.sine.phase);;
    elseif(RefSig.type == 3)
        if(mod(t,RefSig.pulse.period) < RefSig.pulse.width*RefSig.pulse.period)
            refSig = RefSig.pulse.highValue;
        else
            refSig = RefSig.pulse.lowValue;
        end
        refSigDerivative = 0;
        refSigSecondDerivative = 0;
        refSigThirdDerivative = 0;
    end
    out = [refSig; refSigDerivative; refSigSecondDerivative; refSigThirdDerivative];
end

