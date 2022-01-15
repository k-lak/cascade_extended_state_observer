function [ z_hat_p ] = esoObserver( input )
    global ESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = ESO.gainVectorN3;

    z_hat = input(1:3);
    y = input(4);
    u = input(5);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat_p = Ao*z_hat + Bo*u + L*(y - z_hat(1));
end

