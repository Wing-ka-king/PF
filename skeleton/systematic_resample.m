% function S = systematic_resample(S_bar)
% This function performs systematic re-sampling
% Inputs:   
%           S_bar(t):       4XM
% Outputs:
%           S(t):           4XM
function S = systematic_resample(S_bar)
cdf = cumsum(S_bar(4,:));
M = size(S_bar,2);
S = zeros(size(S_bar));
r = 1/M*rand;
for i = 1:M
    m = find(cdf >= (r + (i-1)/M), 1,'first');
    S(1:3,i) = S_bar(1:3,m);
end
S(4,:) = 1/M*ones(size(S_bar(4,:)));
end