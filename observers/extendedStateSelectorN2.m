function [z_hat] = extendedStateSelectorN2(input)

z_hat_1 = input(1:3);
z_hat_2 = input(4:6);

z_hat = [z_hat_2(1:2); z_hat_1(3)+z_hat_2(3)];
end

