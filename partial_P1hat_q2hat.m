function z = partial_P1hat_q2hat(Prm,q)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

M = Inertia(Prm,q);
psi = Psi(Prm,q);

a1 = m2*l1*l2*cos(q(2))*(psi(2,2)-psi(2,1))+(m2*l1*l2*sin(q(2)))^2/sqrt(M(2,2))*psi(1,1)^2;
a2 = (-2*m2*l1*l2*sin(q(2))+2*M(1,2)/M(2,2)*m2*l1*l2*sin(q(2)))*m2*l1*l2*sin(q(2))*(psi(2,2)-psi(2,1));
z = (a1-a2)/(psi(1,1)^4*psi(2,2)^2);
