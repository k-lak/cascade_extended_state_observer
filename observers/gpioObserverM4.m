function [ z_hat_p ] = gpioObserverM4( input )
    global ESO Controller

    b_hat = Controller.adrc.inputGainEstimate;
    L = ESO.gainVectorN6;

    z_hat = input(1:6);
    y = input(7);
    u = input(8);

    Ao = [0 1 0 0 0 0;...
         0 0 1 0 0 0;...
         0 0 0 1 0 0;...
         0 0 0 0 1 0;...
         0 0 0 0 0 1;...
         0 0 0 0 0 0];
    Bo = [0; -b_hat; 0; 0; 0; 0];

    z_hat_p = Ao*z_hat + Bo*u + L*(y - z_hat(1));
end

