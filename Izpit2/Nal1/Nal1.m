format 'long'

g = @(x,y) 2.0*(exp(-4.0*((x-2.00).^2 + (y-2.90).^2)) + exp(-4.0*((x-1.0).^2 + (y-2.0).^2)) + exp(-3.70*((x-4.0).^2 + (y-2.0).^2)));
f = @(x,y) sin(sin(x+y)) + g(x,y);
 
x = linspace(0,5,101);
y = linspace(0,5,101);

[X,Y] = meshgrid(x,y);
F = f(X,Y);
% figure
% hold on
% surf(X,Y,F)
% shading interp

%1.1
[Fmax,idx] = max(F(:));
[FmaxRow,FmaxCol] = ind2sub(size(F), idx);
xmax = x(FmaxCol);
ymax = y(FmaxRow);
norma = norm([xmax;ymax;Fmax],2);

%2.1