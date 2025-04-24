La = 1.96 * 10^(-3);
Ra = 1.6;
J = 459 * 10^(-7);
K = 0.065;

A = [-Ra/La, -K/La; K/J, 0;];
B = [1/La, 0; 0, -1/J];
C = [1, 0; 0, 1];
D = [0, 0; 0, 0];

syms s;
syms t;

phi_s = inv(s * eye(2, 2) - A);
phi_t = ilaplace(phi_s, t);

[nums1, dens1] = ss2tf(A, B, C, D, 1);
[nums2, dens2] = ss2tf(A, B, C, D, 2);

Ts11 = tf(nums1(1, :), dens1);
Ts21 = tf(nums1(2, :), dens1);
Ts12 = tf(nums2(1, :), dens2);
Ts22 = tf(nums2(2, :), dens2);

Ts = [Ts11, Ts12; Ts21, Ts22];

v_in_t = 24 * heaviside(1);
Me_sr = 0.04;

u_t = [v_in_t; Me_sr];