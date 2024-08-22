format("long")
T0=[2.52;6.00];
T1=[8.00;4.04];
L = [1.58,1.50,1.58,1.58,1.50,1.58];
M = [1.00,2.00,3.00,4.00,5.00,6.00];
w0 = [-1; -6];
X = diskrVeriznica(w0,T0,T1,L,M);
% n = length(L);
% figure
% hold on
% for i=1:(n+1)
%     plot(X(1,i),X(2,i),'o')
% end
% plot(X(1,:),X(2,:))

%2.1
visina1 = (X(2,1) + X(2,2))/2;

%2.2
ordinatemin = zeros(1,6);
for i=1:6
    Mi = zeros(1,6);
    Mi(i) = M(i);
    Xi = diskrVeriznica(w0,T0,T1,L,Mi);
    okraski = zeros(1,6);
    for j=1:6
        okraski(j) = (Xi(2,j) + Xi(2,j+1))/2;
    end
    ordinatemin(i) = min(okraski);
end
okrasekMin = min(ordinatemin);

%2.3
T02 = [T0(1) + L(1), T0(2)];
L2 = L(2:end);
M2 = M(2:end);
X2 = diskrVeriznica(w0,T02,T1,L2,M2);
okraski = zeros(1,length(L2));
for j=1:length(L2)
    okraski(j) = (X2(2,j) + X2(2,j+1))/2;
end
okrasekMinNov = min(okraski);

%2.4