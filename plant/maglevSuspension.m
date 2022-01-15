function [out] = maglevSuspension(input)
    global Plant
    Ms = Plant.maglevSuspension.Ms;
    Kb = Plant.maglevSuspension.Kb;
    Kf = Plant.maglevSuspension.Kf;
    Rc = Plant.maglevSuspension.Rc;
    g = Plant.maglevSuspension.g;
    Lc = Plant.maglevSuspension.Lc;
    Nc = Plant.maglevSuspension.Nc;
    Ap = Plant.maglevSuspension.Ap;

    i = input(1);
    z_dot = input(2);
    G = input(3);
    z_t_dot = input(4);
    vc = input(5);

    B = Kb * i / G;
    F = Kf * B ^ 2;
    G_dot = z_t_dot - z_dot;
    i_dot = (vc - i*Rc + (Nc * Ap * Kb)/G^2 * G_dot)/(Nc * Ap * Kb / G + Lc);
    z_ddot = g - 1/Ms * F;

    out = [i_dot; z_ddot; G];
end

