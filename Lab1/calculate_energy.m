function E_numeric = calculate_energy(R, T)
    syms t;
    p = generate_sim_power(R);
    E = int(p, t, 0, T);
    E_numeric = double(E);
end

function v = generate_sim_voltage()
    syms t;
    f = 50;
    phi = 0;
    v = 230 * sqrt(2) * sin(2 * pi * f * t + phi);
end

function p = generate_sim_power(R)
    v = generate_sim_voltage();
    p = v^2 / R;
end