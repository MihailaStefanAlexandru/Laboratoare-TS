function [u0, us, tu0, y0, ys, ty0, ty63] = get_1st_order_elements(timp, v_in, omega)

    u0 = v_in(1);
    us = v_in(end);

    y0 = omega(1);
    ys = omega(end);

    %se stabileste timpul de date (aleg eu)
    tu0 = timp(5);
    ty0 = timp(20);

    y63 = 0.63 * ys;
    [~, idx] = min(abs(omega - y63));

    ty63 = timp(idx);

end

function [K, T, Td] = get_experimental_model(u0, us, tu0, y0, ys, ty0, ty63)

    K = (ys - y0) / (us - u0);
    T = ty63 - ty0;
    Td = ty0 - tu0;

end

table = readtable("date_identificare.xlsx");

timp = table.timp;
v_in = table.v_in;
m = table.m;
omega = table.omega;
ia = table.ia;

[u0, us, tu0, y0, ys, ty0, ty63] = get_1st_order_elements(timp, v_in, omega);

[K, T, Tdelta] = get_experimental_model(u0, us, tu0, y0, ys, ty0, ty63)

display(K);
display(T);
display(Tdelta);

s = tf('s');
H = K * exp(-s * Tdelta) / (T * s + 1);

tsim = linspace(timp(1), timp(end), length(timp));
[y_custom, t_custom] = lsim(H, v_in, tsim);

figure;
plot(t_custom, y_custom, 'LineWidth', 2);
hold on;
plot(timp, omega, 'o');
hold off;
legend('Estimat', 'Masurat');
xlabel('Timp(s)');
ylabel('Raspuns');
title('Raspunsul Sistemului Masurat vs Estimat');