function z = partial_beta_qhat(Prm,k,q,q_hat,x_hat)

m1 = Prm(1);
m2 = Prm(2);
l1 = Prm(3);
l2 = Prm(4);


P1hat_q2hat = partial_P1hat_q2hat(Prm,q_hat);
P2hat_q2hat = partial_P2hat_q2hat(Prm,q_hat);

M = Inertia(Prm,q_hat);
psi = Psi(Prm,q_hat);

P1_hat = P1(Prm,q_hat);
P2_hat = P2(Prm,q_hat);


a = q(1)*(P1hat_q2hat*x_hat(2)*psi(1,1)+(P1_hat*x_hat(2)+k)*(-m2*l1*l2*sin(q_hat(2))+M(1,2)/M(2,2)*m2*l1*l2*sin(q_hat(2)))+P2hat_q2hat*x_hat(2)*psi(2,1)-P2_hat*x_hat(2)*m2*l1*l2*sin(q_hat(2))/sqrt(M(2,2)))+P2hat_q2hat*x_hat(2)*psi(2,2)*q(2);
b = q(1)*(-P2hat_q2hat*x_hat(1)*psi(2,1)-(k-P2_hat*x_hat(1))*m2*l1*l2*sin(q_hat(2))/sqrt(M(2,2))-P1hat_q2hat*x_hat(1)*psi(1,1)-P1_hat*x_hat(1)/psi(1,1)*(-m2*l1*l2*sin(q_hat(2))+M(1,2)/M(2,2)*m2*l1*l2*sin(q_hat(2))))-P2hat_q2hat*x_hat(1)*psi(2,2)*q(2);

z = [0, a; 0, b];