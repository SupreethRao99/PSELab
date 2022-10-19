% Supreeth Rao 1MS19EE057 12/10/2022
% Calculation of ABCD parameters
% Long TL - T
clc;
clear all;

L = 300 ;%input('Enter the length of the transmission line in km: ');
R = 0.15; %input('Enter the value of resistance per unit length: ');
X = 0.6 ; %input('Enter the value of reactance per unit length: ');
Z1 = complex(R,X);
G = 0.00001 ;%input('Enter the value of admittance per unit length:');

Y1 = complex(0, G);
Y = L*Y1;
Z = L*Z1;
if L < 80;
    A = 1
    B = Z
    C = 0
    D = 1
else if L > 240;
        Zc = sqrt(Z1/Y1);
        gamma = sqrt(Z1*Y1);
        A = cosh(gamma*L)
        B = Zc*sinh(gamma*L)
        C = (1/Zc)*sinh(gamma*L)
        D = A
    else
        model = 1 ;%input('Which model to implement 1. T model 2. pi model:');
        if(model == 1)
            A = 1+(Y*Z)/2
            B = Z*(1+(Y*Z)/4)
            C = Y
            D=A
        else
            A = 1+(Y*Z)/2
            B = Z
            C = Y*(1+(Y*Z)/4)
            D = A
        end
    end
end

%calculation of voltage regulation and efficiency
Vrl = 110000;% input('Enter the value of receiving end line voltage:');
p = 40000000; %input('Enter the value of receiving end power:');
pf = 0.8; %input('Enter the value of receiving end power factor:');
Vr = Vrl/1.732;
x = sqrt(1-pf*pf);
magIr = p/(1.732*Vrl*pf);
Ir = complex(magIr*pf, -magIr*x);
Vs = (A*Vr)+(B*Ir);
Is = (C*Vr)+(D*Ir);

%voltage regulation
Vr0= abs(Vs/A)
reg = ((Vr0-Vr)/Vr)*100

%Efficiency
input = real(3*Vs*conj(Is))
output = real(3*Vr*conj(Ir))
efficiency = (output/input)*100