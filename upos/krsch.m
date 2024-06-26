clear all
clc
f=50e6;
L=10*10^(-9);
csub=1.6e-6;
pal=0.028e-6;
fr=5e9;
q=30;
Lk=400e-9;
gsub=4e4;
w=15e-6;
t=2e-6;
tox=35e-9;
tm=3e-6;
eo=8.85*10^-12
u0=4.384*10^-2;
ual=1.000023*4*pi*10^(-7);
Sl=q/f
rs=6.06*L/Sl
b=1.684e-6;
eox=35*10^-12;
l=(rs*w*b*exp(t/b)-rs*b*w)/(pal*exp(t/b))
Cox=w*l*eox/tox
ce=1/((2*pi*fr)^2*L)
Rsi=2/w/l/gsub
Csi=w*l*csub/2
Rp=1/((2*pi*f)^(2)*Cox^2*Rsi)+Rsi*(Cox+Csi)^2/Cox^2
Cp=Cox*(1+(2*pi*f)^(2)*(Cox+Csi)*Csi*Rsi^2)/(1+(2*pi*f)^(2)*(Cox+Csi)^2*Rsi^2)
Cs=ce-Cp
re=rs+Rp
y1=i*(2*pi*f)*ce+(re+i*(2*pi*f)*L)/(Rp*(rs+i*(2*pi*f)*L));
G1=real(y1);
B1=imag(y1);
C0=(G1^2-B1^2)/(2*B1)/(2*pi*f)
gm=(-(2*(G1^2-B1^2)/(2*B1))-2*B1)*G1/((G1^2-B1^2)/(2*B1))
U=0.5;
Ic=pi*U/(4*2*pi*L*f*q)
cox=eo*3.9/tox
Wtranz=(3*gm)^(2)*Lk/(2*cox*Ic*u0)
%%
x1=268.705
x2=301.508
dbdiff=20*log10(x1/x2)
%%
I07=2e-3
Cox=5*10^-3
Ugs=0.3
u0=4.387*10^-3
Ltr=0.4*10^-6
w=I07/u0/Cox*2*Ltr/(Ugs)^2
K=2/pi*sqrt(2*I07*u0*Cox*w/Ltr)*500
%%
r=1000
l=3.183e-6
c=79.58e-12
Q=sqrt(l/c)/r
fc=1/(2*pi*sqrt(l*c))
%%
clear all
clc
r=200
ugs=11.756e-3*r+6.152
r2=100e3
r1=r2*4.5/ugs-r2
%%
q=15;
r=500;
f=40e6;
L=r/(f*2*pi*q)
C=L*q^2/r^2
f=1/(2*pi*sqrt(L*C));
q=r*sqrt(C/L);
%%
clear all 
clc
gm=0.021;
Cox=9.86*10^(-3);
Ic=4.2/2*10^(-3);
u0=4.384*10^(-2);
Lk=400e-9
Wtranz=(3*gm)^(2)*Lk/(2*Cox*Ic*u0)
wtranz12=Wtranz
%%
%%u=4.384*10^-2
uin=0.015;
k=5;
uout=k*uin;
Udc=sqrt(10)*uout;
Rd=500;
Idc=Udc/Rd;
%%
Ugs=0.421
Rs=(4.5-Udc-Udc)/Idc
Ug=Ugs+Idc*Rs
R2=100e3;
R1=R2*4.5/Ug-R2

%%
mu=4.384e-2
Ic=4.743e-4
W=300e-6;
L=0.4e-6;
Cox=3.9*8.85e-12/2.5e-9;
u=0.367;
u0=0.2607;
gm=sqrt(2*mu*Cox*W/L*Ic)
gm1=(mu*Cox*W/L*(u-u0))
