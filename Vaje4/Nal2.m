%NAL2
R = 5;
n = 10; % v bistvu zelimo n+1 dolg vektor u, ker je se indeks 0

%konst sila
F1 = @(r) 1;
u1 = opno(F1,R,n);
x = linspace(-R,R,2*n + 1);
U1 = [0,flip(u1),u1(2:end),0];
% neki ne dela, idk:((
figure
plot(x,U1)