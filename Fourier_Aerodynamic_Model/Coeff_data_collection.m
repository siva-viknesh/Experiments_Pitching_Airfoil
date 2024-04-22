%clear all;
clc;
Cl  = importdata('Fourier_coeff_CL.dat',' ',1);  Cl  = Cl.data;
Cdp = importdata('Fourier_coeff_Cdp.dat',' ',1); Cdp = Cdp.data;
Cm  = importdata('Fourier_coeff_Cm.dat',' ',1);  Cm  = Cm.data;
%---------------------- FOR N=1 DATA APPEND -----------------------%
%---------- Cl coefficients
ao_cl  = [ao_cl Cl(:,1)];
a1_cl  = [a1_cl Cl(:,2)];
b1_cl  = [b1_cl Cl(:,3)];
%---------- Cdp coefficients
ao_cdp  = [ao_cdp Cdp(:,1)];
a1_cdp  = [a1_cdp Cdp(:,2)];
b1_cdp  = [b1_cdp Cdp(:,3)];
%---------- Cm coefficients
ao_cm  = [ao_cm Cm(:,1)];
a1_cm  = [a1_cm Cm(:,2)];
b1_cm  = [b1_cm Cm(:,3)];
%%
k = Cm (:,4);
aoa = [14 15 16];
load hahn1
cftool
%%
%---------------------- FOR N>1 DATA APPEND -----------------------%
%---------- Cl coefficients
temp = zeros(length(ao_cl(:,1))-length(Cl(:,1)),1);
ao_cl  = [ao_cl [Cl(:,1); temp]];
a1_cl  = [a1_cl [Cl(:,2); temp]];
b1_cl  = [b1_cl [Cl(:,3); temp]];
%---------- Cdp coefficients
ao_cdp  = [ao_cdp [Cdp(:,1); temp]];
a1_cdp  = [a1_cdp [Cdp(:,2); temp]];
b1_cdp  = [b1_cdp [Cdp(:,3); temp]];
%---------- Cm coefficients
ao_cm  = [ao_cm [Cm(:,1); temp]];
a1_cm  = [a1_cm [Cm(:,2); temp]];
b1_cm  = [b1_cm [Cm(:,3); temp]];