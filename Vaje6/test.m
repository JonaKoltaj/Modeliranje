function U = test(n)
U = ones(n+2,n+2);
U(2:n+1,2:n+1) = zeros(n,n);
gauss_seidl(U,0.0002)
jacobi(U,0.0002)