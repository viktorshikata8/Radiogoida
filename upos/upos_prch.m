% %1
clc
clear all
Uc1=(10:10:150);
Upch1=[0.009 0.638 0.966 1.192 1.417 1.557 1.694 1.740 1.804 1.847 1.869 1.890 1.912 1.944 1.955];
Uc2=(10:20:150);
Upch2=[0 .977 1.192 1.321 1.428 1.514 1.611 1.665];
Uc3=(10:20:150);
Upch3=[0 .681 1.074 1.460 1.912 2.320 2.696 3.007];
figure(1)
plot(Uc1,Upch1), hold on, grid on
xlabel('Uc, мВ')
ylabel('Uпч, В')
figure(2)
plot(Uc2,Upch2), hold on, grid on
xlabel('Uc, мВ')
ylabel('Uпч, В')
figure(3)
plot(Uc3,Upch3), hold on, grid on
xlabel('Uc, мВ')
ylabel('Uпч, В')

%% 2
clc
clear all
fc=[500:500:3000];
Upch1=[0.710 1.020 1.063 0.876 0.709 .956];
Upch2=[0.718 0.865 0.891 1.149 0.840 0.797];
Upch3=[0.460 0.660 0.715 0.543 0.691 0.708];
Uc=27*10^(-3);
figure(1)
plot(fc,Upch1./Uc), hold on, grid on
xlabel('f, кГц')
ylabel('Kпр ')
figure(2)
plot(fc,Upch2./Uc), hold on, grid on
xlabel('f, кГц')
ylabel('Kпр ')
figure(3)
plot(fc,Upch3./Uc), hold on, grid on
xlabel('f, кГц')
ylabel('Kпр ')
%% 3
clc
clear all
fg=1500;
fcosn=fg-465
fczerk=fg+465
Upch1=1.074 ;
Upch1zerk=0.789;
Upch2=0.913;
Upch2zerk=1.009;
Upch3=0.684 ;
Upch3zerk=0.511;
%% 4
clc
clear all
fc=[1035 1965 2535 3465 4035 4965]
Upch1=[1.009 0.789 0.140 0.131 0.037 0.021]
Upch2=[0.902 1.009 0.009 0.018 0.050 0.042]
Upch3=[0.667 0.511 0.230 0.227 0.221 0.147]
plot(fc,Upch1/Upch1(1),'.'), hold on, grid on
xlabel('f, кГц')
ylabel('Uпч/Uпч.осн,к ')
figure(2)
plot(fc,Upch2/Upch2(1),'.'), hold on, grid on
xlabel('f, кГц')
ylabel('Uпч/Uпч.осн,к ')
figure(3)
plot(fc,Upch3/Upch3(1),'.'), hold on, grid on
xlabel('f, кГц')
ylabel('Uпч/Uпч.осн,к ')
%% 5
clc
clear all
fc=[985 465]
upch1=[1.052 1.955]
upch2=[0.934 0.012]
upch3=[0.672 0.081]
%% help
fileID = fopen('myfile.txt','w');
nbytes = fprintf(fileID,'% 1.4f\n',upch3);
fclose(fileID);
type('myfile.txt')