format("long")
bC = [0     -0.92     0.00     1.10     2.50     3.00;     5.00     3.00     0.00     2.00     4.02     6.00];
fx = @(t) deCasteljau(bC(1,:),t);
fy = @(t) deCasteljau(bC(2,:),t);
syms t
fun = matlabFunction(sqrt(diff(fx(t)).^2 + diff(fy(t)).^2));
l = integral(fun,0,3)
