x1 = 1.5;
y1 = 2;
y2 = 1;

NUM = [x1];
DEN = [y1, y2];

H = tf(NUM, DEN);

[Y, T] = step(H);

plot(out.simout)
plot(out.simout.Time, out.simout.Data(: ,1))