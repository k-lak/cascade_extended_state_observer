function [u] = adrc(input)
    global Controller 

    b_hat = Controller.adrc.inputMatrixEstimate;
    K = Controller.adrc.gainMatrix;

    z_hat = input(1:3);

    u = 1/b_hat*(z_hat(3)+K*z_hat(1:2));
end