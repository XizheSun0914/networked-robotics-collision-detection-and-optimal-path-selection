function z = Coriolis(Prm,q,q_dot)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

c11 = -m2*l1*l2*q_dot(2)*sin(q(2));
c12 = -m2*l1*l2*(q_dot(1)+q_dot(2))*sin(q(2));
c21 = m2*l1*l2*q_dot(1)*sin(q(2));
c22 = 0;

z = [c11, c12; c21, c22];