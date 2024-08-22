function T = tezisceKrivulje(f,a,b)
mtx = integral(@(x) x.*f(x),a,b);
mty = integral(@(x) (f(x).^2)./2,a,b);
at = integral(f,a,b);

T = [mtx./at,mty./at];