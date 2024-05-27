%% c1
clear all
clc
fcmin=643.1;
uoutrezmin=0.092;
fcmax=1504.3;
uoutrezmax=0.301;
fc=[750 1000 1200 1400];
uoutrez=[0.115 0.168 0.217 0.271];
f1=[fcmin,fc,fcmax]
u1=[uoutrezmin, uoutrez, uoutrezmax]
K1=u1/uoutrezmin
%% c2
fcmin=631.6;
uoutrezmin=0.265;
fcmax=1418.4;
uoutrezmax=0.999;
fc=[700 1000 1200 1400];
uoutrez=[0.407 0.580 0.770 0.980];
f2=[fcmin,fc,fcmax]
u2=[uoutrezmin, uoutrez, uoutrezmax]
K2=u2/uoutrezmin
%% c3
fcmin=632.2;
uoutrezmin=0.403;
fcmax=1341.4;
uoutrezmax=1.440;
fc=[699 911 1096 1243];
uoutrez=[0.591 0.948 1.142 1.359];
f3=[fcmin,fc,fcmax]
u3=[uoutrezmin, uoutrez, uoutrezmax]
K3=u3/uoutrezmin
%%
figure(1)
plot(f1,K1,f2,K2,f3,K3), hold on, grid on
xlabel('fc, кГц')
ylabel('Ku0/Ku0min')
%% M

fcmin=533.8;
uoutrezmin=0.133;
fcmax=1496.7;
uoutrezmax=0.05;
fc=[800 1000 1200 1400];
uoutrez=[0.101 0.072 0.061 0.053];
Kurez=uoutrez./uoutrezmax;
fm=[fcmin,fc,fcmax];
um=[uoutrezmin,uoutrez,uoutrezmax];
Km=um/uoutrezmax;
h=(1-(fa^2/fcmax^2))/(fa^2/fcmin^2)
%% M+c1
fcmin=527.2;
uoutrezmin=0.027;
fcmax=1505;
uoutrezmax=0.273;
fc=[750 1000 1250 1500];
uoutrez=[0.048 0.111 0.191 0.265];
Kurez=uoutrez./uoutrezmin;
fmc1=[fcmin,fc,fcmax];
umc1=[uoutrezmin,uoutrez,uoutrezmax];
Kmc1=umc1/uoutrezmin;;
%%
figure(1)
plot(fm,Km,fmc1,Kmc1), hold on, grid on
xlabel('fc, кГц')
ylabel('Ku0/Ku0min')
%% удлин антенна 
clear all
clc
fa=528.1;
urez=.057;
%% rasstr
fc1niz=642.7;
fc2niz=630;
fc3niz=636.5;
fc1up=1495.6;
fc2up=1418.1;
fc3up=1348.8;
fdiffdown2=fc1niz-fc2niz
fdiffdown3=fc1niz-fc3niz
fdiffup2=fc1up-fc2up
fdiffup3=fc1up-fc3up
%% rez char с1
clear all
clc
fmin1=[ 621.8 625.8 626.3 628.2 630.2 643 652.1 655.1 658.5 662.3];
umin1=[.051 .059 .061 .066 .071 .092 .069 .061 .055 .047];
fmax1=[1454.6 1467.8 1475.8 1481.1 1504.3 1523.5 1531.4 1542.1 1547.9 1551];
umax1=[0.18 0.212 0.237 0.255 0.301 0.265 0.241 0.211 0.202 0.190];
urezmin1=0.092;
frezmin1=643;
urezmax1=0.301;
frezmax1=1504.3;
%% rez char с2
fmin2=[617.3 617.6 620.8 627.8 631.6 636.5 640.7 644.8 651.2 661.5];
umin2=[.175 .176 .209 .251 .265 .231 .202 0.180 .148 .112];
fmax2=[1357.3 1368.4 1382.9 1385 1418.4 1443.2 1445.6 1448.7 1456.8 1462.4];
umax2=[0.488 0.577 0.692 0.728 0.999 0.757 0.730 0.697 0.621 0.575];
urezmin2=0.265;
frezmin2=631.6;
urezmax2=0.999;
frezmax2=1418.4;
%% rez char с3
fmin3=[593.2 600.1 609.5 614.2 622.5  632.2 639.5 642.6 645.1 649.7];
umin3=[0.166 0.208 0.286 0.312 0.355 0.403 0.272 0.243 0.226 0.202];
fmax3=[1291.2 1301.7 1308.5 1319.1 1341.4 1368.4 1373.6 1377.6 1380.4 1387];
umax3=[0.900 1.009 1.026  1.154 1.440 1.212 1.091 1.007 0.957 0.962];
urezmin3=0.403;
frezmin3=632.2;
urezmax3=1.440;
frezmax3=1341.4;
%% rez induct svz
fminm=[500.8 506.3 511.7 513.2 517.2 533.8 548.8 550.5 551.7 563.3];
uminm=[0.057 0.07 0.09 0.094 0.111 0.133 0.097 0.093 0.09 0.077];
fmaxm=[1435.8 1441.4 1450.6 1460.2 1496.7 1519.3 1528 1543.1 1550 1557.8 ];
umaxm=[0.029 0.030 0.033 0.035 0.05 0.045 0.041 0.035 0.032 0.030 ];
urezminm=0.133;
frezminm=533.8;
urezmaxm=0.05;
frezmaxm=1496.7;
%%
plot(fmax1-frezmax1,umax1/urezmax1,'-black*',fmax2-frezmax2,umax2/urezmax2,'-blacko',fmax3-frezmax3,umax3/urezmax3,'black--',fmaxm-frezmaxm,umaxm/urezmaxm,'black:'), hold on , grid on
legend('C1','C2','C3','M')
xlabel('fc-fрез, кГц')
ylabel('Uвых/Uрез')

%%
fileID = fopen('myfile.txt','w');
nbytes = fprintf(fileID,'% 1.4f\n',umax);
fclose(fileID);
type('myfile.txt')