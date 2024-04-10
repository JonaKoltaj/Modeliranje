function X = diskrVeriznica(w0,obesisceL,obesisceD,L,M)
% preko fsolve najde u in v, tako da F(u,v) = [0; 0], nato veriznico narise.
% w0 = [u0;v0] zacetna priblizka, obesisceL = [x_0;y_0], obesisceD = [x_n+1;y_n+1]
% L = dolzine palic (vektor), M = mase palic (vektor).
% X = 2x(n+2) v zg vrstici xi, v sp vrstici yi
n = length(L) - 1;
mi = zeros(1,n);
for i=1:n
    mi(i) = (M(i)+M(i+1))/2;
end
vsote_mi = [0,cumsum(mi)];

ksi = @(u,v) L./sqrt(1+(v-u.*vsote_mi));
eta = @(u,v) ksi(u,v).*(v-u.*vsote_mi);
U = @(u,v) sum(ksi(u,v)) - obesisceD(1) + obesisceL(1);
V = @(u,v) sum(eta(u,v)) - obesisceD(2) + obesisceL(2);
F = @(w) [U(w(1),w(2));V(w(1),w(2))];

w = fsolve(F,w0);
X = zeros(2,n+2);
X(:,1) = obesisceL;
vsote_ksi = cumsum(ksi(w(1),w(2)));
vsote_eta = cumsum(eta(w(1),w(2)));
for i=2:(n+2)
    X(1,i) = obesisceL(1) + vsote_ksi(i-1);
    X(2,i) = obesisceL(2) + vsote_eta(i-1);
end
