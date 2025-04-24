function sim_analyze

    V = generate_voltage_matrix(0, 1, 100);
    analyze_voltage_matrix(V)

end

function analyze_voltage_matrix(V)

    disp(size(V));
    vector = zeros(3, 2);
    
    vector(1, 1) = max(V(1, :));
    vector(2, 1) = max(V(2, :));
    vector(3, 1) = max(V(3, :));

    vector(1, 2) = mean(V(1, :));
    vector(2, 2) = mean(V(2, :));
    vector(3, 2) = mean(V(3, :));

    disp(vector);

end

function V = generate_voltage_matrix(t_start, t_final, n)

    f = 50;
    phi1 = 0;
    phi2 = -2*pi/3;
    phi3 = -4*pi/3;

    [v1, ~] = voltage_scenario(t_start, t_final, f, phi1, n);
    [v2, ~] = voltage_scenario(t_start, t_final, f, phi2, n);
    [v3, ~] = voltage_scenario(t_start, t_final, f, phi3, n);

    V = [v1; v2; v3];

end

function y = generate_voltage(f, phi, t)
    y = 230 * sqrt(2) * sin(2 * pi * t * f + phi);
end

function [y, t] = voltage_scenario(t_start, t_final, f, phi, n)
    t = linspace(t_start, t_final, n);
    y = generate_voltage(f, phi, t);
end

