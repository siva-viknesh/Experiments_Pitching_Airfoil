clc
clear all;
% close all;
format long
c = .160;                           % chord
b = c*0.5;
V = 8;                              % Freestream velocity
a = -0.5;                           % Pitching at Quater chord
AoA_mean = 0;                       % Mean AoA
AoA_amp = 1;                        % Oscillation Amplitude
% Reduced Frequency
% k = [ 0.1 0.2 0.3 0.4 0.5 0.6 0.7];         
k = 0.1:0.05:1.5;
N = 257;
Nc = 20;             % No. of cycles
AoA = zeros(1,N);
dAoA_dt = zeros(1,N);
d2AoA_dt2 = zeros(1,N);
time = zeros(1,N);
Cl = zeros(length(k),N);
for j = 1:length(k)
    t = c*pi/(k(j)*V);
    dt = t/(N-1);
 for i = 1:N*Nc
    time(i) = dt*(i-1);
    AoA(i) = AoA_mean + AoA_amp*sin( (2*pi*time(i))/t );
    dAoA_dt(i) = AoA_amp*2*pi *cos( 2*pi*time(i)/t) /t;
    d2AoA_dt2(i) = -AoA_amp*(4*(pi^2))*sin(2*pi*time(i)/t)/t;
 end
 % Deg to rad conversion
 AoA = deg2rad(AoA); dAoA_dt = deg2rad(dAoA_dt) ; d2AoA_dt2 = deg2rad(d2AoA_dt2);
 H1 = besselh(1,2,k(j));
 H0 = besselh(0,2,k(j));
 C = H1 / (H1+H0) ;
 Cl = pi*b*(dAoA_dt/V - b*a*d2AoA_dt2/(V^2)) + 2*pi*C*(AoA + b*(0.5-a)*dAoA_dt/V);
 Cl = real (Cl);
 Cm = pi*0.5*(b*b*d2AoA_dt2*(1/8+a^2)/(V^2)) + pi*(a+0.5)*C*(AoA + b*(0.5-a)*dAoA_dt/V) - pi*0.5*b*dAoA_dt*(0.5-a)/V;
 Cm = Cm - Cl/4;
 Cm = real (Cm);
 time = time*2/t;
   y = [time; Cl ; Cm];
   filename = strcat("k_", num2str(k(j)), ".dat");
   fileID = fopen (filename,'w');
   fprintf(fileID, 'variables = time, cl, cmc4 \n');
   fprintf(fileID, '%6.10f %6.14f %6.14f \n',y);
   fclose(fileID);
t0 = 0;
for i = 1 : Nc
  t_stp = find (time>=2*i,1);
  % Bode-plot for Cl data
  [cl1(i),i1] = max(Cl(t0+1:t_stp));
   pcl(i) =  ((i-1)*2 + 0.5) - time(i1+t0);
  % Bode-plot for Cm@c/4 data
   [cm1(i),i1] = max(Cm(t0+1:t_stp));
   pcm(i) = ((i-1)*2 + 0.5) - time(i1+t0);
   t0 = t_stp;
end
   cl_m(j) = mean(cl1);
   t_cl(j) = mean (pcl);
   cm_m(j) = mean(cm1);
   t_cm(j) = mean(pcm);
%  plot (time,real(Cl) ,'*-')
%  hold on
%  title('Effect of Reduced Frequency for Pitching airfoil')
%  xlabel('Time period')
%  ylabel('C_L')
%  legend('K = 0.1','K = 0.2','K = 0.3','K = 0.4','K = 0.5', 'K = 0.6', 'K = 0.7','K = 0.8','K = 0.9','K = 1.0','K = 1.1','K = 1.2','K = 1.3')
end
y = [k; cl_m; cm_m; t_cl; t_cm];
filename = "Bode_plot.dat";
fileID = fopen (filename,'w');
fprintf(fileID, 'variables = k, Rcl, Rcmc4, Pcl, Pcm \n');
fprintf(fileID, '%6.10f %6.14f %6.14f %6.14f %6.14f \n',y);
fclose(fileID);
