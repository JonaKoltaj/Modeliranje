format("long")

c0 = 1.1; %koef zracnega upora
m0 = 73.5; %masa padalca
S0 = 0.152; %povrsina padalca
g0 = 9.81;
r = 6371000; %radij zemlje
g = @(y) g0*((r/(r+y))^2);
f = @(t,y1,y2,g,ro,S,m,c) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

%1.1
gostota = roKviz(5000);

%1.2
Y0 = [10000;0];
m1 = 76.5;
t1 = linspace(0,10,10000);

dY1 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),roKviz(Y(1)),S0,m0,c0)];
[t1,Y1] = ode23s(dY1,t1,Y0);
hitrost10s = Y1(end,2);
dY2 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(1)),roKviz(Y(1)),S0,m1,c0)];
[t1,Y2] = ode23s(dY2,t1,Y0);
hitrostVoda10s = Y2(end,2);
absHitrost10s = hitrost10s - hitrostVoda10s;

%1.3
k = 50;
Y0Stolpnica = [828;0];
f2 = @(t,y1,y2,g,ro,S,m,c) f(t,y1,y2,g,ro,S,m,c) + k/m*max([(728-y1),0]);
dY3 = @(t,Y) [Y(2);f2(t,Y(1),Y(2),g(Y(1)),roKviz(Y(1)),S0,m0,c0)];
[t1,Y3] = ode23s(dY3,t1,Y0Stolpnica);
visinaBungee10s = Y3(end,1);

%1.4
XY0Ptica = [0;0;10;10*sqrt(3)];
funKonec = @(t) pomozna(t);
tKonec = fzero(funKonec,3)
[xKonec,yKonec,dxKonec,dyKonec] = angryBirds(tKonec,XY0Ptica);




%1.5

