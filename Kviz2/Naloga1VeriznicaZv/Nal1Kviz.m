format("long")

A = [0.7;20];
B = [10.9;15.8];
tol = 10^(-16);
l = 15.5;

%1.1
[T_min,w] = zvVeriznica(A,B,l,tol);
y_min = T_min(2);

%1.2
syms x
dw = matlabFunction(diff(w(x)));
odvodB = dw(B(1));

%1.3
levaDolzina = dolzinaKrivulje(A(1),T_min(1),w);
desnaDolzina = dolzinaKrivulje(T_min(1),B(1),w);
minKrajisce = min([A(2) - levaDolzina,B(2) - desnaDolzina]);

%1.4
fun = @(y) pomoznaFunKviz([0.7;y],B,l,tol) - B(2);
yP1 = fzero(fun,25);
premik = yP1 - A(2);

%1.5
:(