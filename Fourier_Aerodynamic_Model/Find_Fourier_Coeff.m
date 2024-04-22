%----- Data-driven Model on Fourier basis
clc;
clear all;
format long
th = 0.15 ;
Aa = 1; Am = 16 ;
%NACA 0012
%cls=0.58147128097555478; cdps =0.1930139791365458; cms =-0.073039347746445091;
%cls=0.54585213729132387; cdps =0.19970372313366086; cms =-0.071096772445818135;
%cls=0.54127068571278236; cdps =0.20912590418816077; cms =-0.061121335419621801;
%NACA 0015
%cls=0.49126276123018936; cdps =0.18686695637650239; cms =-0.073018283058997352;
%cls=0.49862959445294081; cdps =0.19885154984580045; cms =-0.071459495804239298;
cls=0.46667118460027252; cdps =0.20235688300910548; cms =-0.061884664192731129;
file = ls ('K*') ; file = file (2:end,:);
NF = length(file);
coeff_cl = zeros(NF,4); 
coeff_cdp = coeff_cl;
coeff_cm = coeff_cl;
for i = 1: NF
    file(i,:)
    cd (file(i,:))
    A = importdata('cycle.dat',' ',1);
    A = A.data;
    t = A(:,1)*pi; x = t;  %Am*pi/180 + (2*pi/180)*sin()
    cl = smooth(A(:,2));
    cdp = smooth(A(:,4));
    cm = smooth(A(:,5));
%----------------------------- CL data -----------------------------------%
    % Define Start points, fit-function and fit curve
    x0 = [1 1 1]; 
    fitit = fittype( @(a0,a1,b1,x) cls+a0+(1+th)*Aa*(a1*cos(x)+ b1*sin(x)));
    [curv,gof] = fit(x,cl,fitit,'StartPoint',x0);
    % Save the coeffiecient values for a,b,c and d in a vector
    coeff_cl(i,1:3) = coeffvalues(curv);
    coeff_cl(i,4) = i*0.1+0.1 ;
    % Plot results
    % scatter(t, cl, 'r+')
    % hold on
    % plot(t,fitted_curve(t))
    % hold off
%---------------------------- Cdp data -----------------------------------%
    % Define Start points, fit-function and fit curve
    x0 = [1 1 1]; 
    fitit = fittype( @(a0,a1,b1,x) cdps+a0+(1+th)*Aa*(a1*cos(x)+ b1*sin(x)));
    [curv,gof] = fit(x,cdp,fitit,'StartPoint',x0);
    % Save the coeffiecient values for a,b,c and d in a vector
    coeff_cdp(i,1:3) = coeffvalues(curv);
    coeff_cdp(i,4) = i*0.1+ 0.1 ;
    % Plot results
    % scatter(t, cdp, 'r+')
    % hold on
    % plot(t,fitted_curve(t))
    % hold off
%-------------------------------- Cm|c4 data -----------------------------%
    % Define Start points, fit-function and fit curve
    x0 = [1 1 1]; 
    fitit = fittype( @(a0,a1,b1,x) cms+a0+(1+th)*Aa*(a1*cos(x)+ b1*sin(x)));
    [curv,gof] = fit(x,cm,fitit,'StartPoint',x0);
    % Save the coeffiecient values for a,b,c and d in a vector
    coeff_cm(i,1:3) = coeffvalues(curv);
    coeff_cm(i,4) = i*0.1+0.1 ;
    % Plot results
    % scatter(t, cm, 'r+')
    % hold on
    % plot(t,fitted_curve(t))
    % hold off
    cd ../
end
%-------------------- FOURIER COEFF. WRITING - CL ------------------------%
fileID = fopen ('Fourier_coeff_CL.dat','w');
fprintf(fileID, 'variables = a0, a1, b1, k \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cl');
fclose(fileID);
%-------------------- FOURIER COEFF. WRITING - CDP -----------------------%
fileID = fopen ('Fourier_coeff_Cdp.dat','w');
fprintf(fileID, 'variables = a0, a1, b1, k \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cdp');
fclose(fileID);
%-------------------- FOURIER COEFF. WRITING - CM ------------------------%
fileID = fopen ('Fourier_coeff_Cm.dat','w');
fprintf(fileID, 'variables = a0, a1, b1, k \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cm');
fclose(fileID);