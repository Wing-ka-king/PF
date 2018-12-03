% function [S_bar] = predict(S,u,R)
% This function should perform the prediction step of MCL
% Inputs:
%           S(t-1)              4XM
%           v(t)                1X1
%           omega(t)            1X1
%           R                   3X3
%           delta_t             1X1
% Outputs:
%           S_bar(t)            4XM
function S_bar = predict(S,v,omega,R,delta_t)
    M = size(S,2);
    S_bar(1:3,:) = S(1:3,:) + delta_t * [v*cos(S(3,:));v*sin(S(3,:));repmat(omega,1,M)];
    S_bar(1:3,:) = S_bar(1:3,:) + randn(3,M) .* repmat(sqrt(diag(R)),1,M); % Diffusion, assuming an uncorrelated sigma_R
    S_bar(4,:) = S(4,:);
end