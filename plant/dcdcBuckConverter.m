function [ out ] = dcdcBuckConverter( input )
    global Plant

    A = Plant.dcdcBuckConverter.A;
    B = Plant.dcdcBuckConverter.B;
    C = Plant.dcdcBuckConverter.C;

    x = input(1:2);
    u = input(3);

    xp = A*x+B*u;

    out = xp;
end

