function [z_hat] = extendedStateSelectorP4(input)
    z_hat_1 = input(1:3);
    z_hat_2 = input(4:6);
    z_hat_3 = input(7:9);
    z_hat_4 = input(10:12);

    z_hat = [z_hat_4(1:2); z_hat_1(3)+z_hat_2(3)+z_hat_3(3)+z_hat_4(3)];
end

