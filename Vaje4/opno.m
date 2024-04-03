function u = opno(F,R,n)
    % F podana sila, R radij opne
    % najprej definiramo tri diagonalne vektorje
    a = zeros(1,n-1);
    c = zeros(1,n-1);
    a(1) = 1/2;
    c(1) = 2;
    for i=2:(n-1)
        a(i) = 1 - 1/(2*i);
        c(i) = 1 + 1/(2*(i-1));
    end
    b = zeros(1,n) -2;
    % definiramo vektor r-jev, delitev pac
    r = zeros(1,n);
    % vektor je od 0 do n-1, v n vemo da je  rn = R, un = 0
    for i=1:n
        r(i) = (i-1)*(R/(n+1));
    end
    % se vektor f-ov, enako kot zgoraj samo do n-1
    f = zeros(1,n);
    for i=1:n
        f(i) = F(r(i));
    end
    u = resi3(a,b,c,f);
