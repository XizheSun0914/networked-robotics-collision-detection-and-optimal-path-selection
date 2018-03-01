function z = Delta_q(Prm,k,q,q_hat,x_hat)

psi_hat = Psi(Prm,q_hat);
psi = Psi(Prm,q);

p1_hat = P1(Prm,q_hat);
p1 = P1(Prm,q);

p2_hat = P2(Prm,q_hat);
p2 = P2(Prm,q);

d11 = k*(psi(1,1)-psi_hat(1,1))+((p1*psi(1,1)+p2*psi(2,1))-(p1_hat*psi_hat(1,1)+p2_hat*psi_hat(2,1)))*x_hat(2);
d12 = (p2*psi(2,2)-p2_hat*psi_hat(2,2))*x_hat(2);
d21 = k*(psi(2,1)-psi_hat(2,1))-((p1*psi(1,1)+p2*psi(2,1))-(p1_hat*psi_hat(1,1)+p2_hat*psi_hat(2,1)))*x_hat(1);
d22 = k*(psi(2,2)-psi_hat(2,2))-(p2*psi(2,2)-p2_hat*psi_hat(2,2))*x_hat(1);

z = [d11, d12; d21, d22];