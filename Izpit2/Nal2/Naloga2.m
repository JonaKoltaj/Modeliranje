format 'long'

A = [0.10;1.00];
B = [3.50;0.01];
l = 5.54;
tol = 10^(-16);

[T_min,w] = zvVeriznica(A,B,l,tol);

%2.1
syms x
expr1 = matlabFunction(sqrt(1+(diff(w(x))).^2));
expr2 = @(x) expr1(x).*w(x);
energija = integral(expr2,A(1),B(1));

%2.2
T_tez = tezisceKrivulje(w,A(1),B(1));
tezisce = norm(T_tez,2);
% plot(T_tez(1),T_tez(2),'x')

% %2.3
% fun = @(y) ordinata(A,[B(1),y],l,tol)+1;
% yB = fsolve(fun,0);
% razdaljaB = norm([B(1);yB]);
% 
% %2.4
% A_prestavljen = [0;0];
% B_prestavljen = [B(1)-A(1);B(2)-A(2)];
% fun2 = @(d) casPotovanjaVeriznica(A_prestavljen,B_prestavljen,d,tol) - 1.5;
% l0 = fsolve(fun2,9);
