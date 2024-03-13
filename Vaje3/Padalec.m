c = 1;
m = 105;
S = 1.2;
g0 = 9.81;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);

%1
ro1 = 1.225;
t = linspace(0,300,10000);
Y0 = [40000;0];
dY1 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g0,ro1)];
[t,Y1] = ode45(dY1,t,Y0);
povprecna1 = mean(Y1(:,2))
figure
hold on
plot(t,-Y1(:,2),'r')

%2
koncna1 = Y1(end,2)

%3
r = 6371;
g = @(y) g0*((r/(r+y))^2);
dY2 = @(t,Y) [Y(2);f(t,Y(1),Y(2),g(Y(2)),ro1)];
[t,Y2] = ode45(dY2,t,Y0);
visina300 = Y2(end,1)
plot(t,-Y2(:,2),'b')

%4

