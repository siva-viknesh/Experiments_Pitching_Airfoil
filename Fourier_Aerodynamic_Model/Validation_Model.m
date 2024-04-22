%---------- COMPARISON OF AERODkNAMIC MODEL WITH EAmPERIMENTS -------------%
clc;
clear all;
C = importdata ('NACA0015_Amp2.dat');
filename = 'NACA0015_16AoAm_2AoAa_k_0.2.dat';
T = 0:0.01:8*pi ;               % No. of cycles = 4
k    = 0.2;                     % Reduced Frequency
Am   = 16 ;                     % Mean AoA
Aa   = 2 ;                      % Oscillation Amplitude
th   = 0.15;                    % Airfoil thickness to chord ratio
%NACA 0012
%cls=0.58147128097555478; cdps =0.1930139791365458; cms =-0.073039347746445091;
%cls=0.54585213729132387; cdps =0.19970372313366086; cms =-0.071096772445818135;
%cls=0.54127068571278236; cdps =0.20912590418816077; cms =-0.061121335419621801;
%NACA 0015
%cls=0.49126276123018936; cdps =0.18686695637650239; cms =-0.073018283058997352;
%cls=0.49862959445294081; cdps =0.19885154984580045; cms =-0.071459495804239298;
cls=0.46667118460027252; cdps =0.20235688300910548; cms =-0.061884664192731129;
% --------------> FOURIER COEFFICIENTS & CONSTANTS
%-------------> COEFFICIENT OF LIFT
C0 = C(1,1) ;      C1 = C(1,2) ;       C2 = C(1,3) ;
C3 = C(1,4) ;      C4 = C(1,5) ;       C5 = C(1,6) ;
C6 = C(1,7) ;      C7 = C(1,8) ;       C8 = C(1,9) ;
A0  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(2,1) ;      C1 = C(2,2) ;       C2 = C(2,3) ;
C3 = C(2,4) ;      C4 = C(2,5) ;       C5 = C(2,6) ;
C6 = C(2,7) ;      C7 = C(2,8) ;       C8 = C(2,9) ;
A1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(3,1) ;      C1 = C(3,2) ;       C2 = C(3,3) ;
C3 = C(3,4) ;      C4 = C(3,5) ;       C5 = C(3,6) ;
C6 = C(3,7) ;      C7 = C(3,8) ;       C8 = C(3,9) ;
B1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
Cl  = cls  + (1+th)*Aa*(A0 + A1*cos(T) + B1*sin(T) ); 
%-------------> COEFFICIENT OF PRESSURE DRAG
C0 = C(4,1) ;      C1 = C(4,2) ;       C2 = C(4,3) ;
C3 = C(4,4) ;      C4 = C(4,5) ;       C5 = C(4,6) ;
C6 = C(4,7) ;      C7 = C(4,8) ;       C8 = C(4,9) ;
A0  =C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(5,1) ;      C1 = C(5,2) ;       C2 = C(5,3) ;
C3 = C(5,4) ;      C4 = C(5,5) ;       C5 = C(5,6) ;
C6 = C(5,7) ;      C7 = C(5,8) ;       C8 = C(5,9) ;
A1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(6,1) ;      C1 = C(6,2) ;       C2 = C(6,3) ;
C3 = C(6,4) ;      C4 = C(6,5) ;       C5 = C(6,6) ;
C6 = C(6,7) ;      C7 = C(6,8) ;       C8 = C(6,9) ;
B1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
Cdp = cdps + (1+th)*Aa*(A0 + A1*cos(T)+ B1*sin(T));
%-------------> COEFFICIENT OF MOMENT ABOUT QUATER CHORD
C0 = C(7,1) ;      C1 = C(7,2) ;       C2 = C(7,3) ;
C3 = C(7,4) ;      C4 = C(7,5) ;       C5 = C(7,6) ;
C6 = C(7,7) ;      C7 = C(7,8) ;       C8 = C(7,9) ;
A0  =C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(8,1) ;      C1 = C(8,2) ;       C2 = C(8,3) ;
C3 = C(8,4) ;      C4 = C(8,5) ;       C5 = C(8,6) ;
C6 = C(8,7) ;      C7 = C(8,8) ;       C8 = C(8,9) ;
A1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
C0 = C(9,1) ;      C1 = C(9,2) ;       C2 = C(9,3) ;
C3 = C(9,4) ;      C4 = C(9,5) ;       C5 = C(9,6) ;
C6 = C(9,7) ;      C7 = C(9,8) ;       C8 = C(9,9) ;
B1  = C0 + Aa*(1+th)*(C1*sin(Am+C2*k^2+C3)+ C4*cos(C5*k^3+C6*k^2+C7*Am+k+C8)) ;
Cm  = cms  + (1+th)*Aa*(A0 + A1*cos(T) + B1*sin(T) );
%----------------------------- DATA WRITING ------------------------------%
k = [T/pi ;Cl ;Cdp ;Cm];
fileID = fopen (filename,'w');
fprintf(fileID, 'variables = t,cl,cdp,cm \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',k);
fclose(fileID);
plot(T,Cl)