% Supreeth Rao 1MS19EE057 21/09/2022
% Y-Bus formation without mutual coupling
clc;
clear all;
close all;
%     p  q      z       hlc(ADM)
z = [
      1  2  0.02+0.06i  0.06i
      1  3  0.08+0.24i  0.05i
      2  3  0.06+0.18i  0.04i
      3  5  0.06+0.18i  0.04i
      2  5  0.04+0.12i  0.03i
      3  4  0.01+0.03i  0.02i
      4  5  0.08+0.24i  0.05i
      ];

fb = z(:,1);
tb = z(:,2);
Z = z(:,3);
hlc = z(:,4);
y = 1./Z;

nbus = max(max(fb),max(tb));
Y = zeros(nbus);
nline = length(tb);

for k =1:nline
    p = fb(k);
    q = tb(k);
    Y(p,p) = Y(p,p)+y(k)+hlc(k);
    Y(q,q) = Y(q,q)+y(k)+hlc(k);
    Y(p,q) = Y(p,q)-y(k);
    Y(q,p) = Y(p,q);
end
Ybus = Y