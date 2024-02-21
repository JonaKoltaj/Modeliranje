function A = blocna (n)
    v1 = zeros(1,n) - 4;
    v2 = ones(1, n-1);
    T = diag(v1) + diag(v2, 1) + diag(v2, -1);
    A = zeros(n^2, n^2)