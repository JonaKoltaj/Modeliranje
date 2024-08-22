function T_min_y = pomoznaFunKviz(A,B,l,tol)
[T_min,~] = zvVeriznica(A,B,l,tol);
T_min_y = T_min(2);