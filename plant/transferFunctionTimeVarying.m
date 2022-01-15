function [ out ] = transferFunctionTimeVarying( input )
    global Plant

    A = Plant.transferFunction.A;
    C = Plant.transferFunction.C;

    x = input(1:2);
    u = input(3);
    t = input(4);
    
    B =[0  (1+0.2*tanh((t-2)))/(abs(x(1))+1)]';

    xp = A*x+B*u;

    out = xp;
end

