function [z_hat] = extendedStateSelectorP5(input)
    z_hat_1 = input(1:3);
    z_hat_2 = input(4:6);
    z_hat_3 = input(7:9);
    z_hat_4 = input(10:12);
    z_hat_5 = input(13:15);

    z_hat = [z_hat_5(1:2); z_hat_1(3)+z_hat_2(3)+z_hat_3(3)+z_hat_4(3)+z_hat_5(3)];
end

