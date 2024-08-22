function t = casPotovanjaPoKrivulji(f,a,b)
g = 9.81;
syms x
expr1 = matlabFunction(sqrt(1+(diff(f(x))).^2));
expr2 = @(x) expr1(x)./sqrt(-2.*g.*f(x));
t = integral(expr2,a,b);
