c = 1;
m = 105;
S = 1.2;
g0 = 9.81;
f = @(t,y1,y2,g,ro) - g - ((ro*c*S)/(2*m))*y2*abs(y2);