function z = Inertia(Prm,q)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

m11 = m2*l2^2+(m1+m2)*l1^2+2*m2*l1*l2*cos(q(2));
m12 = m2*l2^2+m2*l1*l2*cos(q(2));
m21 = m12;
m22 = m2*l2^2;

z = [m11, m12; m21, m22];