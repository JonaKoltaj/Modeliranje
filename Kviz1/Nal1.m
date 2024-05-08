format("long")

c0 = 1; %koef zracnega upora
m0 = 90; %masa padalca
S0 = 0.9; %povrsina padalca
g0 = 9.81;
r = 6371000; %radij zemlje
Y0 = [40000;0]; %zacetna visina
g = @(y) g0*((r/(r+y))^2);
f = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

visine = [0 2000 4000 6000 8000 10000 15000 20000 25000 30000 40000];
gostote = [1.225 1.007 0.8194 0.6601 0.5258 0.4135 0.1948 0.08891 0.04008 0.01841 0.003996];
fun = @(x) [ones(size(x)); x.^2; x.^4];
fun2 = @(y) fun((y - 40000)/40000);
A = fun2(visine);
koef = (A.')\(gostote.');
ro = @(y) polyval([koef(3), 0, koef(2), 0, koef(1)], (y - 40000)/40000); %funkcija zracnega upora

%a
t1 = linspace(0,25,10000);
dY1 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S0,m0,c0)];
[t1,Y1] = ode23s(dY1,t1,Y0);

pot25s = Y1(end,1); %25*10000/3
prepotovano25s = 40000 - pot25s;

%b
m1 = 190;
c1 = 1.1;
S1 = 1;
t2 = linspace(0,60,10000);
dY2 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S1,m1,c1)];
[t2,Y2] = ode23s(dY2,t2,Y0);

[t2,Y12] = ode23s(dY1,t2,Y0);

hitrostBrez60s = Y12(end,2);
hitrostZ60s = Y2(end,2);
hitrost60s = abs(hitrostZ60s - hitrostBrez60s);

%c
S2 = 10.9;
c2 = 5;
% nima zacetne hitrosti nic:(
fun = @(t) pomoznaFun1(t,c0,S0) + pomoznaFun1(400 - t,c2,S2) - 40000;
fun(399)


