function z = S(Prm,q,x)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);

psi = Psi(Prm,q);

s12 = m2*l1*l2*sin(q(2))*(psi(2,2)-psi(2,1))*x(1)/(psi(1,1)^2*psi(2,2)^2)+m2*l1*l2*sin(q(2))*x(2)/(psi(1,1)*psi(2,2)^2);

z = [0, s12; -s12, 0];
