%---------------------SYMMETRIC AIRFOIL GENERATION------------------------%
format long 
clc;
clear all;
x = linspace(0,1,26);
c =  150 ; 			% Chord
t = .15 ;			% Thickness
y = 5*t*(0.2969*sqrt(x)-0.1260*x-0.3516*x.^2+0.2843*x.^3-0.1036*x.^4);
 x = x*c;
 y = y*c;
% [x1,w]=lgwt(17,0,1);
% x1 = fliplr(x1');
x1 = linspace(0,1,17);
y1= -5*t*(0.2969*sqrt(x1)-0.1260*x1-0.3516*x1.^2+0.2843*x1.^3-0.1036*x1.^4);
x1 = x1 * c ;
y1 = y1*c;
figure (1)
plot(x,y,'-+k')
%xlim ([0 1])
%ylim ([-0.5 0.5]) 
hold on
plot (x1,y1,'-+r')

g = [x flip(x) ; y flip(y1)];
figure (2)
plot (g(1,:), g(2,:))
fileID = fopen ('NACA_coordinates.dat','w');
fprintf(fileID, '%6.10f %6.14f\n',g);
fclose(fileID);