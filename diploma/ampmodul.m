%% базовая модуляция СМХ
Eb=[0.33 0.39:0.05:0.59 0.65:0.05:0.8];
Ik0=[2 5 7 10 13 18 25 28 36 40];
Ikont=[4 9 14 20 26 33 43 46 51 56];
[sig,sigmax]=read_signal('eb100.csv',0.006);
k=k+1;
maxsig(k)=sigmax;
%% Ik0
Ebmodul=[0.33 0.39:0.05:0.59 0.65:0.05:1]
ik0modul(:)=1000*10.^((-[47.08 43.4 40.81 38.56 36.59 34.84 32.96 31.59 30.26 29.07 28.32 27.68 26.86 25.994]./20));
plot(Eb, Ik0,'-o',Ebmodul,ik0modul,'LineWidth',2,'Color','k')
title('Зависимость постоянной составляющей тока коллектора от напряжения смещения')
xlabel('Eб, В','FontSize',14,'FontWeight','bold')
ylabel('Ik0, мА','FontSize',14,'FontWeight','bold')
grid on
legend('Результаты эксперимента','Результаты моделирования',Location='northwest')
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35;
%% Iконт
Ebmodul=[0.33 0.39:0.05:0.59 0.65:0.05:1]
maxsigikont=1000*[0.0106072606457668	0.0148914543818824	0.0190267659959878	0.0236344571377160	0.0286175040618517	0.0338710025298805	0.0404020710204195	0.0459307330735354	0.0514526516418691	0.0569011459786893 0.065179	0.0728370955877444 0.075361	0.0764853318406958]
plot(Eb, Ikont,'-o',Ebmodul,maxsigikont,'LineWidth',2,'Color','k')
title('Статическая модуляционная характеристика ')
xlabel('Eб, В','FontSize',14,'FontWeight','bold')
ylabel('Ikонт, мА','FontSize',14,'FontWeight','bold')
grid on
legend('Результаты эксперимента','Результаты моделирования',Location='northwest')
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35
%% базовая модуляция ДМХ
uomega=[.01 0.02 0.027 0.029 0.036 0.041 0.048 0.059 0.068 0.082 0.098 0.114 0.128 0.141 0.16 0.178 0.194 ];
mpositive=[2 11 17 22 28 32 39 48 53 62 69 77 82 86 92 97 100];
mnegative=[2 11 16 21 27 31 37 46 51 61 71 79 85 89 94 97 99];
mpos=100*[1.88/31.1 4.53/30.3 5.68/30.6 6.015/30.5 7.312/30.5 8.208/30.6 9.38/30.9 11.43/31.04 13.01/31 15.29/31.89 17.88/32.3 20.72/32.7 23.11/33.3 25.16/34 27.99/35.31 30.6/36.6 0.9001];
mneg=100*[2.4/26.4 4.069/26.4 5.298/26.6 5.50/26.7 6.7/26.6 7.568/26.7 8.695/26.7 10.37/27.01 11.874/27.3 13.895/27.8 16.49/28.3 19.027/29.02 21.11/29.7 23.05/30.4 25.26/31.62 28.02/33.6 0.89];
%%
plot(uomega,mnegative,'--', uomega, mneg,'-o','LineWidth',2,'Color','k')
title('Динамическая модуляционная характеристика ')
xlabel('U, В','FontSize',12,'FontWeight','bold')
ylabel('m,%','FontSize',12,'FontWeight','bold')
legend('Результаты эксперимента','Результаты моделирования',Location='southeast')
grid on
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 18; ax.GridAlpha = 0.35
%% базовая модуляция ДМХ частоты
F=[10 20 40 80 100 200 400 800 1000:1000:8000];
mpositive=[7 12 20 30 34 43 50 52 54 52 46 41 37 31 29 26]
mnegative=[7 11 19 29 33 44 51 53 53 51 45 39 35 30 28 25]
pos=[]
neg=[]
plot(F,mpositive,'--o', F, mnegative,'-o','LineWidth',2,'Color','k')
title('Зависимость ДМХ от частоты ')
xlabel('F, Гц','FontSize',12,'FontWeight','bold')
ylabel('m,%','FontSize',12,'FontWeight','bold')
legend('m+','m-')
grid on
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 18; ax.GridAlpha = 0.35
%% коллекторная модуляция СМХ
Ek=[1 1.5 2 2.5 3.1 3.6 4 4.5 5.1 5.5 6.2 6.5 7 7.5 8 8.5 9 9.6 10 10.5 11];
Ik0=[15 20 21 22 22 23 23 23 24 25 25 25 25 25 25 25 25 25 25 25 25];
Ikont=[9 15 19 23 26 29 30 32 34 36 37 38 38 40 41 41 42 42 43 43 44];
%% Ik0
plot(Ek, Ik0,'-o','LineWidth',2,'Color','k')
title('Зависимость постоянной составляющей тока коллектора от амплитудного напряжения на коллекторе ')
xlabel('Eб, В','FontSize',12,'FontWeight','bold')
ylabel('Ik0, мА','FontSize',12,'FontWeight','bold')
grid on
grid on
legend('Ik0=f(Eк)')
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 18; ax.GridAlpha = 0.35
%% Iконт
plot(Ek, Ikont,'-o','LineWidth',2,'Color','k')
title('Статическая модуляционная характеристика ')
xlabel('Eк, В','FontSize',12,'FontWeight','bold')
ylabel('Ikонт, мА','FontSize',12,'FontWeight','bold')
grid on
legend('Ikont=f(Eк)')
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35;
%% коллекторная модуляция ДМХ
uomega=[0.1 0.5 0.8 1.2 1.4 1.8 2.1 2.4 2.8 3.1];
mpositive=[7 20 29 42 51 65 74 86 95 100]
mnegative=[6 19 30 44 54 69 81 94 100 100]
plot(uomega,mpositive, uomega, mnegative)
grid on
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35;
%% коллекторная модуляция ДМХ частоты
F=[10 20 40 80 100 200 400 800 1000:1000:8000];
mpositive=[47 47 48 48 47 48 48 47 48 47 46 45 44 42 40 39];
mnegative=[50 51 51 51 51 51 51 51 51 51 49 48 46 45 43 41];
plot(F,mpositive, F, mnegative)
grid on
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35;
%% коллекторная модуляция СМХ комбинированная цепь
Ek1=[1:1:10];
ikont=[7.143 11.984 16.764 21.568 26.342 31.104 35.927 40.363 40.657 40.915]
Ikont1=rot90(rot90([42 39 37 34 31 28 24 20 15 8]));
plot(Ek1, Ikont1,'--o',Ek1,ikont,'-o','LineWidth',2,'Color','k')
title('Статическая модуляционная характеристика при комбинированном подключении ')
xlabel('Eк, В','FontSize',12,'FontWeight','bold')
ylabel('Ikонт, мА','FontSize',12,'FontWeight','bold')
legend('Результаты эксперимента','Результаты моделирования')
ax = gca; ax.FontWeight = 'bold'; ax.FontSize = 14; ax.GridAlpha = 0.35;
grid on
%% коллекторная модуляция автосмещение
Ek=[10.1 9:-1:1];
EbR2=[0.64 0.63 0.63 0.62 0.61 0.61 0.6 0.6 0.59 0.58]
EbR3=[0.64 0.63 0.63 0.62 0.61 0.6 0.59 0.59 0.58 0.57]
EbR4=[0.65 0.64 0.63 0.62 0.61 0.6 0.59 0.58 0.57 0.56]
%% коллекторная модуляция комбин цепь ДМХ
uomega=[0.3 0.4 0.7 1.1 1.4 1.7 2.2 2.7 3.4 4 4.4 5.3 5.8 6.3 6.6 6.8];
mpositive=[2 9 16 23 27 32 41 50 65 78 82 90 94 96 98 100];
mnegative=[1 9 16 23 29 34 47 62 90 100 100 100 100 100 100 100]