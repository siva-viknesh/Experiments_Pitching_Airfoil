%---------------- INTERPOLATION OF FOURIER BASIS COEFFICIEN --------------%
clc ;
clear all;
format long
load Fourier_basis_data.mat
N_data = length (ao_cl(1,:));
k = 0.2:0.1:1.5;
N_k = length (ao_cl(:,1));
Ao_cl  = zeros(N_k,1);   A1_cl  = Ao_cl ;   B1_cl  = Ao_cl ;
Ao_cdp = zeros(N_k,1);   A1_cdp = Ao_cl ;   B1_cdp = Ao_cl ;
Ao_cm  = zeros(N_k,1);   A1_cm  = Ao_cl ;   B1_cm  = Ao_cl ;
for i= 1 : N_k
    %----------------- Cl FOURIER BASIS COEFFICIENT ---------------%
    Ao_cl(i) = mean(nonzeros(ao_cl(i,:)));
    A1_cl(i) = mean(nonzeros(a1_cl(i,:)));
    B1_cl(i) = mean(nonzeros(b1_cl(i,:)));
    %----------------- Cdp FOURIER BASIS COEFFICIENT --------------%
    Ao_cdp(i) = mean(nonzeros(ao_cdp(i,:)));
    A1_cdp(i) = mean(nonzeros(a1_cdp(i,:)));
    B1_cdp(i) = mean(nonzeros(b1_cdp(i,:)));
    %----------------- Cm FOURIER BASIS COEFFICIENT ---------------%
    Ao_cm(i) = mean(nonzeros(ao_cm(i,:)));
    A1_cm(i) = mean(nonzeros(a1_cm(i,:)));
    B1_cm(i) = mean(nonzeros(b1_cm(i,:)));
end
% plot(k, Ao_cl)
% load hahn1
% cftool
%-------------------- FOURIER COEFF. WRITING - CL ------------------------%
coeff_cl = [k' Ao_cl A1_cl B1_cl];
fileID = fopen ('Fourier_coeff_CL.dat','w');
fprintf(fileID, 'variables = k, a0, a1, b1 \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cl');
fclose(fileID);
%-------------------- FOURIER COEFF. WRITING - CDP -----------------------%
coeff_cdp = [k' Ao_cdp A1_cdp B1_cdp];
fileID = fopen ('Fourier_coeff_Cdp.dat','w');
fprintf(fileID, 'variables = k, a0, a1, b1 \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cdp');
fclose(fileID);
%-------------------- FOURIER COEFF. WRITING - CM ------------------------%
coeff_cm = [k' Ao_cm A1_cm B1_cm];
fileID = fopen ('Fourier_coeff_Cm.dat','w');
fprintf(fileID, 'variables = k,a0, a1, b1 \n');
fprintf(fileID, '% 10.6f %10.6f %10.6f %10.6f\n',coeff_cm');
fclose(fileID);