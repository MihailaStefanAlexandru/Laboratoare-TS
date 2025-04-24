La = 1.96 * 10^(-3);
Ra = 1.6;
J = 459 * 10^(-7);
K = 0.065;

A = [-Ra/La, -K/La; K/J, 0;];
B = [1/La, 0; 0, -1/J];
C = [1, 0; 0, 1];
D = [0, 0; 0, 0];

h = 0.01;

syms t;

A_aux = A * h;

A_d = double(expm(A_aux));
B_d = double(int(expm(A * t) * B, 0, h));
C_d = C;
D_d = D;

display(A_d);
display(B_d);
display(C_d);
display(D_d);

[nums1, dens1] = ss2tf(A, B, C, D, 1);
[nums2, dens2] = ss2tf(A, B, C, D, 2);

H11s = tf(nums1(1, :), dens1);
H21s = tf(nums1(2, :), dens1);
H12s = tf(nums2(1, :), dens2);
H22s = tf(nums2(2, :), dens2);

H11z = c2d(H11s, h); 
H21z = c2d(H21s, h);
H12z = c2d(H12s, h);
H22z = c2d(H22s, h);

[numz1(1, :), denz1] = tfdata(H11z, 'v');
[numz1(2, :), denz1] = tfdata(H21z, 'v');
[numz2(1, :), denz2] = tfdata(H12z, 'v');
[numz2(2, :), denz2] = tfdata(H22z, 'v');