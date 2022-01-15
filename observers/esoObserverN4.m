function [ z_hat_p ] = esoObserverN4( input )
    global ESO Controller

    b_hat = Controller.adrc.inputMatrixEstimate;
    L = ESO.gainVectorN4;

    z_hat = input(1:4);
    y = input(5);
    u = input(6);

    Ao = [0 1 0 0;...
         0 0 1 0;...
         0 0 0 1;...
         0 0 0 0];
    Bo = [0; -b_hat; 0; 0];

    z_hat_p = Ao*z_hat + Bo*u + L*(y - z_hat(1));
end

