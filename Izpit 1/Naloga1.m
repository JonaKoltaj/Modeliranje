format("long")

c0 = 1.4; %koef zracnega upora
m0 = 127; %masa padalca
S0 = 0.9; %povrsina padalca
g0 = 9.81;
r = 6371000; %radij zemlje
g = @(y) g0.*((r/(r+y)).^2);
f = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)./(2*m)).*y2.*abs(y2);
ro = @(y) (5.0e-03)+(6.5e-02).*((y-40000)./40000).^2+1.2.*((y-40000)./40000).^4;
t = linspace(0,200,10000);

%1.1
Y0 = [40000;0];
Y0odriv = [40000;-100];
dY = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),ro(Y(1)),S0,m0,c0)];
[t,Y1] = ode23(dY,t,Y0);
[t,Y2] = ode23(dY,t,Y0odriv);
razlika = abs(Y1(end,2) - Y2(end,2));
% figure
% hold on
% plot(t,-Y1(:,2),'r')
% plot(t,-Y1odriv(:,2),'g')

%1.2
fun = @(m) PomoznaFunTeza(m);
masa = fzero(fun,114);

%1.3
fun2 = @(t) razdaljaMedPadalcema(t) - 1000;
casRazdalja = fzero(fun2,15);

