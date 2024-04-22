clc
clear all;
close all;
format long
M = 0.01:0.001:0.1;
nu = 1.4;
for i=1:length(M)
Cp(i) = 2/(nu*M(i)^2)*( ((2+(nu+1)* M(i)^2)/(nu+1))^(nu/(nu-1))-1);
a0 = 1/sqrt(1-M(i).^2);
a1 = (Cp(i) - 1/sqrt(1-M(i).^2))/(1-M(i));  % Newton linear interpolation
Cp_comp(i) = a0 + a1*(0.3);                 %   (two data point )
end
plot (M, Cp,'*-')
hold on
plot (M,Cp_comp,'o')
xlabel ('M_{\infty}')
ylabel ('Cp')
legend ('Sonic line', 'Compressible line')
Cp_stag = 1.0 ;

