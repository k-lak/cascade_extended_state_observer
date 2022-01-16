function [ out ] = cesoObserverP5( input )
    global cascadedESO Controller

    b_hat = Controller.adrc.inputGainEstimate;
    L1 = cascadedESO.gainVectorFirst;
    L2 = cascadedESO.gainVectorSecond;
    L3 = cascadedESO.gainVectorThird;
    L4 = cascadedESO.gainVectorFourth;
    L5 = cascadedESO.gainVectorFifth;

    z_hat1 = input(1:3);
    z_hat2 = input(4:6);
    z_hat3 = input(7:9);
    z_hat4 = input(10:12);
    z_hat5 = input(13:15);
    y = input(16);
    u = input(17);

    Ao = [0 1 0;...
         0 0 1;...
         0 0 0];
    Bo = [0; -b_hat; 0];

    z_hat1_p = Ao*z_hat1 + Bo*u + L1*(y - z_hat1(1));
    z_hat2_p = Ao*z_hat2 + Bo*u - Bo*1/b_hat*z_hat1(3) + L2*(z_hat1(1) - z_hat2(1));
    z_hat3_p = Ao*z_hat3 + Bo*u - Bo*1/b_hat*(z_hat1(3)+z_hat2(3)) + L3*(z_hat2(1) - z_hat3(1));
    z_hat4_p = Ao*z_hat4 + Bo*u - Bo*1/b_hat*(z_hat1(3)+z_hat2(3)+z_hat3(3)) + L4*(z_hat3(1) - z_hat4(1));
    z_hat5_p = Ao*z_hat5 + Bo*u - Bo*1/b_hat*(z_hat1(3)+z_hat2(3)+z_hat3(3)+z_hat4(3)) + L5*(z_hat4(1) - z_hat5(1));
    
    out = [z_hat1_p; z_hat2_p; z_hat3_p; z_hat4_p; z_hat5_p]; 
end

