function z = partial_P2hat_q2hat(Prm,q)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

M = Inertia(Prm,q);
psi = Psi(Prm,q);

z = (m2*l1*l2*cos(q(2))-m2*l1*l2*sin(q(2))/psi(1,1)*(-m2*l1*l2*sin(q(2))+M(1,2)/M(2,2)*m2*l1*l2*sin(q(2))))/(psi(1,1)^2*psi(2,2)^2);