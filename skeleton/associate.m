% function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate(S_bar,z,W,Lambda_psi,Q)
N = size(W,2);
M = size(S_bar,2);
n = size(z,2);
inv_Q = inv(Q);

z_hat = observation_model(S_bar,W,1);
for i=2:N
    temp = observation_model(S_bar,W,i);
    z_hat = [z_hat temp];
end
% z_hat 2X(N*M)
psi = zeros(M,n);
outlier = zeros(1,n);

for i=1:n
    diff = repmat(z(:,i),1,M*N);
    nu = z_hat - diff;
    nu(2,:) = mod(nu(2,:)+pi,2*pi)-pi;
    psi_hat = (det(2*pi*Q))^(-1/2)*exp((-1/2)*sum(nu .*(inv_Q*nu),1)); %psi_hat 1X(M*N)
    psi_hat = reshape(psi_hat,M,N);
    psi(:,i) = max(psi_hat,[],2);
    if Lambda_psi >= sum(psi(:,i))/M
        outlier(i) = 1;
    else
        outlier(i) = 0;
    end
end
psi = psi';
Psi = reshape(psi,1,n,M);

end