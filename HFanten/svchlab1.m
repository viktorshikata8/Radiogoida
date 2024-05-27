%% теор часть
a=2;
l=115.2;
d=10.2
L=[0.24:0.02:0.76 0.8 0.85 0.9 0.95 1.00 1.05 1.1 1.15 1.2 1.25 1.3 1.35 1.4 1.45 1.5 1.55]
Ra=[6 8 10.6 13.2 16.9 20.8 25.3 30.6 36.1 42.6 49.4 56.8 64.8 73.1 81.9 91.1 100.5 110 119.8 129.4 139.1 148.5 157.6 166.4 174.5 182.1 189.1 195 200 195.1 178.1 166.4 157.4 148.5 139.1 129.4 119.8 110 100.5 91.1 89.9 100 110]
Xa=[5.5 6.9 8.6 10.5 12.6 15 17.6 20.5 23.6 26.9 30.6 34.4 38.4 42.5 47.0 51.5 56.2 61 65.8 70.8 75.7 80.6 85.8 90.1 94.9 99.2 103.5 118 120 118 103.5 92.2 86.9 81.1 76.8 70.6 63.7 58.8 54.8 48.3 46.5 48 55]
wa=120.*(log(l/a)-1)
lyambda=2*l./L;
k=2*pi./lyambda;
ZA=Ra+j.*Xa;
Za=wa.*((ZA./wa).*sin(k.*l)-j.*cos(k.*l))./(sin(k.*l)-j.*(ZA./wa).*cos(k.*l))/2;
%% петля
aekv=d*sqrt(2*a/d)
wa=120.*(log(d/(2*a)+sqrt(d/(2*a)^2-1)));
lyambda=2*l./L;
k=2*pi./lyambda;
Zshl=j.*wa.*tan(k.*l);
ZA=Ra+j.*Xa;
Zpv=4.*ZA.*Zshl./(4.*ZA+Zshl)
Za=wa.*((ZA./wa).*sin(k.*l)-j.*cos(k.*l))./(sin(k.*l)-j.*(ZA./wa).*cos(k.*l))/2;
%% график
plot(L, real(Za),L,imag(Za)) 
xlabel('2l/λ')
ylabel('Ra Ra, Ом')
legend('Rateor','Rareal')
grid on
%% кз
clear active
clear reactive
fileIDa=fopen('active.txt','r');
fileIDr=fopen('reactive.txt','r');
activekz=transpose(fscanf(fileIDa,'%f'));
reactivekz=transpose(fscanf(fileIDr,'%f'));
%% тонкий
clear active
clear reactive
fileID=fopen('active tonki.txt','r');
fileID1=fopen('reactive tonki.txt','r');
active=transpose(fscanf(fileID,'%f'));
reactive=transpose(fscanf(fileID1,'%f'));
%% прямоуг
clear active
clear reactive
fileID=fopen('active pryamo.txt','r');
fileID1=fopen('reactive pryamo.txt','r');
active=transpose(fscanf(fileID,'%f'));
reactive=transpose(fscanf(fileID1,'%f'));
%% толстый
clear active
clear reactive
fileID=fopen('active tolsti.txt','r');
fileID1=fopen('reactive tolsti.txt','r');
active=transpose(fscanf(fileID,'%f'));
reactive=transpose(fscanf(fileID1,'%f'));
%% петля
clear active
clear reactive
fileID=fopen('active pyatla.txt','r');
fileID1=fopen('reactive petlya.txt','r');
active=transpose(fscanf(fileID,'%f'));
reactive=transpose(fscanf(fileID1,'%f'));
%%
f=[1e8:0.015e8:1.6e9];
l=102.4;
lyambda=(299792458)*10^3./f/1.00027;
dlina=2*l./lyambda;
W=50;
Zvh=active+j*reactive;
Zvhkz=j*reactivekz;
tg=(Zvhkz/j/W);
Znagr=W.*(Zvh-j.*W.*(tg))./(W-j.*Zvh.*(tg));
plot(dlina,real(Znagr), dlina, imag(Znagr))
xlabel('2l/λ')
ylabel('Ra Xa, Ом')
legend(' Ra теория','Xa теория',' Ra эксперимент','Xa эксперимент')
grid on
%%
plot(L, real(Za),'--k', L,imag(Za),'--b',dlina,real(Znagr),':k', dlina, imag(Znagr),':b')
xlabel('2l/λ')
ylabel('Ra Xa, Ом')
legend(' Ra теория','Xa теория',' Ra эксперимент','Xa эксперимент')
grid on
%%
plot(f,active,f,reactive)
grid on