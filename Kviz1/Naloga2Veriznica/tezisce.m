function tezisce = tezisce(w0,A,B,L,k)
X = veriznica(w0,A,B,k*L,k*L);
a = (k*L./2);
tez = [a;a].*(X(:,2:end)+X(:,1:(end-1)));
tezisce = sum(tez,2)/sum(k*L);