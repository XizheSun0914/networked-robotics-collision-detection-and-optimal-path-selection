function z = H(Prm,k,q_hat,x_hat)

z = (k*eye(2)+S_bar(Prm,q_hat,x_hat))*Psi(Prm,q_hat);