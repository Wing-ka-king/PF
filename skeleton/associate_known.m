% function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
%           S_bar(t)            4XM
%           z(t)                2Xn
%           W                   2XN
%           Lambda_psi          1X1
%           Q                   2X2
%           known_associations  1Xn
% Outputs: 
%           outlier             1Xn
%           Psi(t)              1XnXM
function [outlier,Psi] = associate_known(S_bar,z,W,Lambda_psi,Q,known_associations)
k = size(W,2);
m = size(S_bar,2);

for i = 1:k
    z_hat(:,i,:) = observation_model(S_bar,W,i)
end

    



%BE SURE THAT YOUR innovation 'nu' has its second component in [-pi, pi]

% also notice that you have to do something here even if you do not have to maximize the likelihood.

end