function t = cas_potovanja(a,b,f)
g = 9.81;
syms x
fun = matlabFunction(sqrt((1 + diff(f(x),x).^2)./(-2.*g.*f(x))));
t = integral(fun,a,b);