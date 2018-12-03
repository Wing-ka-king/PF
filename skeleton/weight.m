% function S_bar = weight(S_bar,Psi,outlier)
%           S_bar(t)            4XM
%           outlier             1Xn
%           Psi(t)              1XnXM
% Outputs: 
%           S_bar(t)            4XM
function S_bar = weight(S_bar,Psi,outlier)

n = size(outlier,2);
M = size(S_bar,2);
Psi = reshape(Psi,n,M);
S_bar(4,:) = ones(1,M);
for i=1:n
    if outlier(i) == 1
        %disp("Outlier!!!!!")
    else
        S_bar(4,:) = S_bar(4,:).*Psi(i,:);
    end
end
S_bar(4,:) = S_bar(4,:)/sum(S_bar(4,:));
end