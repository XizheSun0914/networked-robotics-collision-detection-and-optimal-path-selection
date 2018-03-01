function z = Delta_x(Prm,q,ex)

psi = Psi(Prm,q);

p1 = P1(Prm,q);
p2 = P2(Prm,q);

z = zeros(2);
z(1,1) = -(p1*psi(1,1)+p2*psi(2,1))*ex(2);
z(1,2) = -p2*psi(2,2)*ex(2);
z(2,1) = (p1*psi(1,1)+p2*psi(2,1))*ex(1);
z(2,2) = p2*psi(2,2)*ex(1);