%% task 1
clear all
clc
Ucm=[0:2:12];
fc=[2277.4 2530.9 2583.6 2632.2 2697.3 2761.3 2807.8];
plot(Ucm,fc,'black-'), hold on, grid on
xlabel('Uсм, В')
ylabel('fc, кГц')
%% task 2
clear all 
clc
f=[2275:75:2800];
u0=[1.94 2.6 3.8 5.2 4.25 2.92 2.22 1.78];
u1=[1.86 2.43 3.35 4.45 4.10 3.04 2.31 1.85];
u2=[1.68 2.15 2.78 3.42 3.53 2.92 2.29 1.87];
u12=[1.61 2.03 2.55 3.11 3.32 2.88 2.34 1.92];
plot(f,u0,'-black*',f,u1,'black-o',f,u2,'black--',f,u12,'black:'), hold on, grid on
ylabel('U=, В')
xlabel('fc, кГц')
legend('R1 и R2 отключены','R1 подключен','R2 подключен','R1 и R2 подключены')
%% task 3
clear all 
clc
f=[2315,2400:50:2800];
u0=[5.46 6.23 6.39 5.55 2.81 -0.65 -2.6 -3.82 -4.12 -4.14];
u1=[4.99 5.20 4.92 4.40 2.78 0.89 -0.91 -2.18 -2.97 -3.21];
u2=[4.03 3.8 3.35 3.09 2.51 1.54 0.25 -0.56 -1.26 -1.82];
u12=[3.56 3.3 2.74 2.6 2.31 1.78 0.67 -0.21 -0.75 -1.07];
plot(f,u0,'-black*',f,u1,'black-o',f,u2,'black--',f,u12,'black:'), hold on, grid on
ylabel('U=, В')
xlabel('fc, кГц')
legend('R1 и R2 отключены','R1 подключен','R2 подключен','R1 и R2 подключены')
%% task 4
clear all 
clc
f=[2350:50:2800];
u=[-0.51 -0.65 -0.86 -0.18 0.84 1.78 2.43 2.21 1.96 1.80];
plot(f,u,'black'), hold on, grid on
ylabel('U=, В')
xlabel('fc, кГц')
%% task 5
clear all 
clc
f=[50 100 500 1000 2000 3000 5000 7500 9000 10000 12000 15000];
u0=[0.780 0.885 0.771 0.807 0.825 0.852 0.797 0.686 0.624 0.585 0.518 0.489];
u1=[0.293 0.304 0.307 0.316 0.310 0.313 0.318 0.318 0.318 0.318 0.316 0.315];
u2=[0.241 0.258 0.265 0.273 0.262 0.257 0.240 0.197 0.181 0.170 0.153 0.145];
plot(f,u0,'-black*',f,u1,'black-o',f,u2,'black--'), hold on, grid on
ylabel('U=, В')
xlabel('fc, Гц')
legend('тип 1','тип 2','тип 3')

%%
fileID = fopen('myfile.txt','w');
nbytes = fprintf(fileID,'% 1.3f\n',u2);
fclose(fileID);
type('myfile.txt')