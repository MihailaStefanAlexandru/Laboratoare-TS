function simulate_voltage

    t_start = 0;
    t_final = 0.04;
    n = 100;
    f = 50;
    phi = 0;

    [y, t] = voltage_scenario(t_start, t_final, f, phi, n); 

    description_scenario = 'Simulare tensiune de alimentare (50 Hz, \phi = 0 rad)';

    plot_signal(t, y, description_scenario);
end

function y = generate_voltage(f, phi, t)
    y = 230 * sqrt(2) * sin(2 * pi * t * f + phi);
end

function [y, t] = voltage_scenario(t_start, t_final, f, phi, n)
    t = linspace(t_start, t_final, n);
    y = generate_voltage(f, phi, t);
end

function plot_signal(t, y, description_scenario)
    figure;
    plot(t, y, 'b-', 'LineWidth', 1.5);
    grid on;
    title(description_scenario);
    xlabel('Timp (s)');
    ylabel('Tensiune(V)');
    legend('Tensiune de Alimentare');
end