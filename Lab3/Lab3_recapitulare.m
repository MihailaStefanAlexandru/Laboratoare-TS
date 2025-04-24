A = [-1, 0, 0; -1, -2, 101; 1, 1, 0];

b = [0; 1; 0];

c_T = [1, 0, 101];

D = 0;

x_0 = [1; 0; -1];

syms s;
syms t;

t_1 = heaviside(t);
u_t = -2 * t_1;

phi_s = inv(s * eye(3, 3) - A);
phi_t = ilaplace(phi_s, t);

x_l = phi_t * x_0;
y_l = c_T * x_l;

H_s = c_T * phi_s * b;
u_s = ilaplace(u_t, t, s);

y_f = ilaplace(H_s * u_s, s, t);

[sim_nums, sim_dens] = numden(H_s);
num_nums = coeffs(sim_nums, 'All');
num_dens = coeffs(sim_dens, 'All');

display(num_nums);
display(num_dens);

figure;
plot(out.simout1 + 1, 'r');hold on;
plot(out.simout2 + 2, 'b');
plot(out.simout3 + 3, 'g');
grid on;
legend('1', '2', '3');