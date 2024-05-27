    clear all
clc
f=[1800 1850 1900 1950 1971 2100 2200 2300 2400 2500 ];
Uopt=[685, 680, 685, 675, 660, 665, 670, 660, 665,  660];
P=[9.62 9.80 7.97 9.47 12.07 2.71 5.80 7.45 4.80 7.80];
v=6*10^(5).*(Uopt.^(0.5));
plot(f,v)
%%
clear all
clc
f=1971;
Uopt=[600,650:5:685];
Pout=[0.4 6.46 8.33 10.04 11.78 13.60 14.28 14.02 11.64];
plot(Uopt,Pout)
%%
clear all
clc
f=1971;
Uopt=675;
Pindb=(-100:10:-30);
Isprl=[1.1 2.4 2.4 1 1.1 1.6 1.75 2.2];
Pout=[0.2 0.22 0.22 1.32 14.53 7.8 6.10 1.95]*10^(-3)
Uopt=[660 590 590 675 680 680 690 700];
Pin=10.^(Pindb./10)
Poutdb=10.*log10(Pout./1);
Ku=10.*log10(Pout./Pin);
etta=(Pindb./Poutdb)
figure(1)
plot(Pindb,Poutdb,Pindb,Ku,Pindb,etta,':')
% figure(2)
% plot(Pindb,Isprl)
%%
clear all
clc
f=1971;
Uopt=675;
Poutdb=-60;
f=[1800 1900 2000 2050 2100 2150 2200 2300 2400 2500 ];
Pout=[10.33 7.63 8.15 12.96 2.65 4.95 5.95 10.28 3.75 7.01]*10^(-3);
Pin=10^(-6);
Ku=Pout./Pin;
Pdb=10*log10(Pout/Pin);

plot(f,Pdb)
%%
clear all
clc
f=[1800 1850 1900 1950 1971 2100 2200 2300 2400 2500 ]*10^6;
Uopt=[685, 680, 685, 675, 660, 665, 670, 660, 665,  660];
v=6*10^(5).*(Uopt.^(0.5));
c=3*10^8;
S=c./v;
lyambd0=c./f;
lyambdc=lyambd0./S;
L=240*10^(-3);
N=L./lyambdc

