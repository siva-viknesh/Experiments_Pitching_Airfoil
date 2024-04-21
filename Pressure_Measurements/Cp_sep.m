clear all;
clc;
format long;
data = importdata('U12_static_data_NACA0012.dat');
AoA = data(:,5);
mAoA = 14;
ndown = 19;
i = 1; a = 0 ;
while a <= mAoA
    a = AoA(i);
    i = i+1 ;
end
 i = i-1;
 str1 = num2str(i);
 pdata =  importdata(strcat('Cp_data',str1,'.dat'));
 cp_up = smooth(pdata(1:end,2));
 x_up = pdata(1:end,1);
 cp_down = pdata(2:ndown,4);
 x_down = pdata (2:ndown,3);
 x = x_up(1):0.000001:1;
 fit = pchip(x_up,cp_up,x);
 for i = 1 : length(x)-1
    df(i) = (fit(i)-fit(i+1));%/(x(i+1)-x(i)); 
 end
  %plot(x_up,cp_up,'*')
 plot(x_up,cp_up,'*',x,fit)
%  hold on
% plot(x(1:end-1),df,'-')
%set(gca, 'YDir','reverse')