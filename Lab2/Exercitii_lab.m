a = 1;
c = 1;
d = 2;
e = 1;

NUM = [a, 1];
DEN = [c, d, e];

H = tf(NUM, DEN);

%figure;
%step(H);
%title('Raspunsul la treaptă al sistemului H(s)');
%xlabel('Timp (s)');
%ylabel('Amplitudine');
%grid on;

plot(out.out_ex);