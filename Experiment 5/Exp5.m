% Supreeth Rao 1MS19EE057 Experiment 5
% To plot swing curve, find the system stability and critical clearning time for a single machine
% connected to an infinite bus

x1 = 0.45;
x2 = 1.25;
x3 = 0.55;
Eg = 1.1;
V = 1;
Pe = 0.9;
f = 50;
M = 0.016;
Pm = Pe;
Pm1 = Eg*V/x1;
Pm2 = Eg*V/x2;
Pm3 = Eg*V/x3;
d0 = asin(Pm/Pm1);
dmax = pi - asin(Pm/Pm3);
dr = ((Pm*(dmax-d0)-(Pm2*cos(d0)) + (Pm3*cos(dmax)))/(Pm3-Pm2));
dcr1 = acos(dr)
dcr = acosd(dr)
tcr = sqrt((2*M*(dcr1-d0)/(pi*f*Pm)))