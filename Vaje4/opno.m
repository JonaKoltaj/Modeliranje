function u = opno (F,R,n)
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
    for i=1:n
        r(i) = (i-1)*(R/n);
    end
    % se vektor f-ov
    f = zeros(1,n);
    for i=1:n
        f(i) = F(r(i-1));
    end
    u = zeros(1,n+1);
    %u(vse razen zadnje) = resi3(a,b,c,f);
