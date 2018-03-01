function z = P2(Prm,q)

m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

psi = Psi(Prm,q);

z = m2*l1*l2*sin(q(2))/(psi(1,1)*psi(2,2)^2);