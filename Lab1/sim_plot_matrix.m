function sim_plot_matrix
    % plot_voltage_matrix(0, 1, 100);
    plot_voltage_matrix_2(0, 1, 100);
end

function plot_voltage_matrix(t_start, t_final, n)

    V = generate_voltage_matrix(t_start, t_final, n);
    
    t = linspace(t_start, t_final, n);

    plot_signal(t, V(1, :), 'Tensiune de alimentare - Faza 1');
    plot_signal(t, V(2, :), 'Tensiune de alimentare - Faza 2');
    plot_signal(t, V(3, :), 'Tensiune de alimentare - Faza 3');
end

function plot_voltage_matrix_2(t_start, t_final, n)

    V = generate_voltage_matrix(t_start, t_final, n);
    
    t = linspace(t_start, t_final, n);

    description_scenario = 'Tensiune de alimentare trifazată';

    figure;
    hold on;

    plot(t, V(1, :), 'r-', 'LineWidth', 1.5);
    plot(t, V(2, :), 'g-', 'LineWidth', 1.5);
    plot(t, V(3, :), 'b-', 'LineWidth', 1.5);

    grid on;
    title(description_scenario);
    xlabel('Timp (s)');
    ylabel('Tensiune (V)');
    legend('Faza 1', 'Faza 2', 'Faza 3');

    hold off;
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