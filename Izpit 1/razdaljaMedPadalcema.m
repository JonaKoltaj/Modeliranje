function d = razdaljaMedPadalcema(t)
c0 = 1.4; %koef zracnega upora
m0 = 127; %masa padalca
S0 = 0.9; %povrsina padalca
g0 = 9.81;
r = 6371000; %radij zemlje
g = @(y) g0.*((r/(r+y)).^2);
f = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)./(2*m)).*y2.*abs(y2);
ro = @(y) (5.0e-03)+(6.5e-02).*((y-40000)./40000).^2+1.2.*((y-40000)./40000).^4;
tsp = linspace(0,t,10000);
tsp2 = linspace(0,t-10,10000);

Y0 = [40000;0];
dY = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S0,m0,c0)];
[~,Y1] = ode23(dY,tsp,Y0);
[~,Y2] = ode23(dY,tsp2,Y0);
d = Y2(end,1) - Y1(end,1);
