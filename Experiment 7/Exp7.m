% Supreeth Rao 1MS19EE057 Experiment 7
% Optimal Generator Scheduling for Thermal Power Plant

clc;
clear;

alpha = [  500;   400;    200];
beta  = [  5.3;   5.5;    5.8];
gamma = [0.004; 0.006;  0.009];
PD=800;
delp=1;
lamada=5;

fprintf("Lamada \t\t p1 \t p2 \t p3 \t \tDp \tgrad \t Delamada\n")
disp('=======================================================================')

iter=0;
while abs(delp)>=0.001
   iter=iter+1;
    p=(lamada-beta)./(2*gamma);
    delp=PD-sum(p);
    j= sum(ones(length(gamma),1)./(2*gamma));
    Delamada=delp/j;
    disp([lamada,p(1),p(2),p(3),delp,j,Delamada])
    lamada=lamada+Delamada;
end
totalcost = sum(alpha+beta.*p+gamma.*p.^2)