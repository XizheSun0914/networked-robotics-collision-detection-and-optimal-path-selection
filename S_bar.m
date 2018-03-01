function z = S_bar(Prm,q,x)

p1 = P1(Prm,q);
p2 = P2(Prm,q);

s11 = p1*x(2);
s12 = p2*x(2);
s21 = -p1*x(1);
s22 = -p2*x(1);

z = [s11, s12; s21, s22];