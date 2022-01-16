function [ out ] = cesoObserverP3( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputGainEstimate;
    L1 = cascadedESO.gainVectorFirst;
    L2 = cascadedESO.gainVectorSecond;
    L3 = cascadedESO.gainVectorThird;

    z_hat1 = input(1:3);
    z_hat2 = input(4:6);
    z_hat3 = input(7:9);
    y = input(10);
    u = input(11);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat1_p = Ao*z_hat1 + Bo*u + L1*(y - z_hat1(1));
    z_hat2_p = Ao*z_hat2 + Bo*u - Bo*1/b_hat*z_hat1(3) + L2*(z_hat1(1) - z_hat2(1));
    z_hat3_p = Ao*z_hat3 + Bo*u - Bo*1/b_hat*(z_hat1(3)+z_hat2(3)) + L3*(z_hat2(1) - z_hat3(1));
    
    out = [z_hat1_p; z_hat2_p; z_hat3_p]; 
end

