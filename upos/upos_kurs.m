fc=40*10^6;
sigma=100;
qke=20;
fpch=fc*sqrt(sigma)/(4*qke)
xi=5;
fmod=45e3
omega=2*pi*fmod
deltaw=2*omega*(xi+1)
width=deltaw/2/pi
l1=13.26e-9;
c1=1.194e-9;
r=50;
Q=r*sqrt(c1/l1)
fctry=1/(2*pi*(l1*c1)^0.5)
qtest=40.007*10e6/(41.373*10e6-38.689*10e6)
x1=0.01;
x2=ans;
db=20*log10(x1/x2)
%%
taumax=0.145*2*pi*50e3/sqrt(1-0.145^2)
%%
    