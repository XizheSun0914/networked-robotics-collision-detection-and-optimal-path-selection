function z = partial_beta_xhat(Prm,q,q_hat)

P1_hat = P1(Prm,q_hat);
P2_hat = P2(Prm,q_hat);

psi = Psi(Prm,q_hat);

a = (P1_hat*psi(1,1)+P2_hat*psi(2,1))*q(1)+P2_hat*psi(2,2)*q(2);
z = [0, a; -a, 0];