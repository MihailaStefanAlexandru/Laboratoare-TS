A = [-1, 0, 0; -1 -2 -101; 1, 1, 0;];

b = [0; 1; 0;];

c_T = [1, 0, 101];

D = 0;

x_0 = [1; 0; -1];

syms s;
syms t;

phi_s = inv(s * eye(3, 3) - A);
phi_t = ilaplace(phi_s, t);

x_l = phi_t * x_0;
y_l = c_T * x_l;

t_1 = heaviside(t);
u_t = -2 * t_1;

u_s = laplace(u_t, t, s);
H_s = c_T * phi_s * b;
y_f = ilaplace(H_s * u_s, s, t);

y_f;
x_l;

plot(out.simout)

[sim_num, sim_den] = numden(H_s);
num_coeffs = coeffs(sim_num, 'All');
den_coeffs = coeffs(sim_den, 'All');

figure;
plot(out.simout1 + 1, 'r');hold on;
plot(out.simout2 + 2, 'b');
plot(out.simout3 + 3, 'g');
grid on;
legend('1', '2', '3');