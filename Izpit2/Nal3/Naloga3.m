A = [cos(0.14);sin(0.14)];
B = [cos(1.28);sin(1.28)];

b1 = [A(1);A(2)+1/2];
b2 = [B(1)+1/2;B(2)];

b = [A,b1,b2,B];
% plotBezier(b,'black','red')

%3.1
fx = @(t) deCasteljau(b(1,:),t);
fy = @(t) deCasteljau(b(2,:),t);
b12 = norm([fx(1/2);fy(1/2)]);

%3.2
norma = @(t) - norm([fx(t);fy(t)]);
normMax = fminbnd(norma,0,1);