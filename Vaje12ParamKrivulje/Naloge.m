X = @(t) -cos(t)+2.*cos(t./2);
Y = @(t) -sin(t)+2.*sin(t./2);
tsp = linspace(0,4*pi);
% figure
% plot(X(tsp),Y(tsp))
% axis equal

%1
T = [X(1),Y(1)];
dolzina = norm(T,2);

%2
syms ts
fun = matlabFunction(sqrt(diff(X(ts),ts).^2 + diff(Y(ts),ts).^2));
L = integral(fun,0,4*pi);