function [out] = referenceDerivativeSelector(input)
global RefSig

filteredDerivatives = input(1:3);
calculatedDerivatives = input(4:6);

if(isequal(RefSig.filter.numerator, 1) && isequal(RefSig.filter.denominator, 1))
    out = calculatedDerivatives;
else
    out = filteredDerivatives;
end

end

