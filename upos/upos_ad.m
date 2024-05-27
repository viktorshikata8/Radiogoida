%% 1.1 slabi r1c1
clc
clear all
upost=[0 0 0 0 0.002 0.008 0.017 0.027 0.040 0.057 0.064];
uc=[0.02 0.06 0.116 0.228 0.294 0.308 0.324 0.342 0.363 0.385 0.395];
upost1=[0 0 0 0 0 0.001 0.010 0.023 0.036 0.046 0.055];
uc1=[0.022 0.067 0.097 0.177 0.264 0.302 0.324 0.347 0.368 0.380 0.398];
plot(uc,upost,'-black*',uc1,upost1,'black-o'), hold on, grid on,
xlabel('Uc, В')
ylabel('U=, В')
legend('R1, C1','R2, C1')
%% 1.2 silni r1c1
clc
clear all
upost=[0.136 0.219 0.305 0.415 0.505 0.614 0.729 0.861 0.982 1.071 1.218 1.413 1.567 1.614];
uc=[0.48 0.57 0.66 0.773 0.865 0.972 1.06 1.195 1.332 1.413 1.565 1.775 1.943 2.0];
upost1=[0.097 0.142 0.206 0.295 0.372 0.455 0.543 0.688 0.779 0.888 0.984 1.089 1.182 1.270 1.469];
uc1=[0.457 0.513 0.587 0.689 0.775 0.869 0.966 1.100 1.203 1.330 1.441 1.563 1.670 1.776 1.985];
plot(uc,upost,'-black*',uc1,upost1,'black-o'), hold on, grid on,
xlabel('Uc, В')
ylabel('U=, В')
legend('R1, C1','R2, C1')
%% 1.3 slabi r2c1
clc
clear all
upost=[0 0 0 0 0 0.001 0.010 0.023 0.036 0.046 0.055];
uc=[0.022 0.067 0.097 0.177 0.264 0.302 0.324 0.347 0.368 0.380 0.398];
%% 1.4 silni r2c1
clc
clear all
upost=[0.097 0.142 0.206 0.295 0.372 0.455 0.543 0.688 0.779 0.888 0.984 1.089 1.182 1.270 1.469];
uc=[0.457 0.513 0.587 0.689 0.775 0.869 0.966 1.100 1.203 1.330 1.441 1.563 1.670 1.776 1.985];
%% 2.1 r1c1
clc
clear all
upost=[0.593 1.026 1.341 1.587 1.789 1.901 2.060 2.118 2.153 2.172];
uc=[0.003:0.003:0.03];
upost1=[0.480 0.905 1.087 1.255 1.419 1.559 1.632 1.675 1.690 1.705];
uc1=[0.003:0.003:0.03];
plot(uc,upost,'-black*',uc1,upost1,'black-o'), hold on, grid on,
xlabel('Uc, В')
ylabel('U=, В')
legend('R1, C1','R2, C1')
%% 2.2 r2c2
clc
clear all
upost=[0.480 0.905 1.087 1.255 1.419 1.559 1.632 1.675 1.690 1.705];
uc=[0.003:0.003:0.03];
%% 3
clc
clear all
upost=[0 0 0.002 0.005 0.01 0.014 0.018 0.022 0.025 0.03 0.032 0.038 0.040];
uc=[0.018 0.056 0.092 0.097 0.111 0.12 0.129 0.14 0.146 0.158 0.165 0.177 0.180 ];
plot(uc,upost,'-black*'), hold on, grid on,
xlabel('Uc, В')
ylabel('U=, В')
%% 4.1 diod detec
clc
clear all
f=[40,100:100:300,500,750,1000,1500,2500:2500:7500,8500,10000:1000:15000];
u11=[.109 .149 .159 .161 .163 .163 .164 .165 .165 .159 .154 .151 .146 .143 .140 .135 .132 .128];
u12=[.105 .151 .162 .164 .165 .167 .167 .17 .17 .169 .168 .168 .168 .167 .167 .166 .166 .165];
u112=[.108 .147 .159 .161 .163 .163 .164 .164 .162 .158  .150 .145 .140 .135 .131 .126 .121 .117];
plot(f,u11,'-black*',f,u12,'black-o',f,u112,'black:'), hold on, grid on,
xlabel('f, Гц')
ylabel('UΩ, В')
legend('C1','C2','C1+C2')
%% 4.2 tranz detec
clc
clear all
f=[40,100:100:300,500,750,1000,1500,2500:2500:7500,8500,10000:1000:15000];
u11=[.088 .124 .135 .136 .138 .138 .138 .139 .139 .138 .136 .135 .134 .132 .131 .129 .128 .127];
u12=[.092 .131 .137 .139 .140 .141 .141 .142 .143 .145 .148 .148 .150 .152 .152 .152 .153 .154];
u112=[.087 .122 .133 .135 .136 .136 .137 .139 .140 .137 .134 .132 .130 .128 .127 .125 .122 .121];
plot(f,u11,'-black*',f,u12,'black-o',f,u112,'black:'), hold on, grid on,
xlabel('f, Гц')
ylabel('UΩ, В')
legend('C1','C2','C1+C2')
%% 4.3 sync detec
clc
clear all
f=[40,100:100:300,500,750,1000,1500,2500:2500:7500,8500,10000:1000:15000];
u=[.040 .052 .056 .057 .057 .057 .057 .058 .058 .056 .055 .054 .053 .053 .052 .051 .051 .050];
plot(f,u,'-black'), hold on, grid on,
xlabel('f, Гц')
ylabel('UΩ, В')
%% 5.1 diod
clc
clear all
uc=[0.25 0.4 0.5 0.6 0.75 0.9 1 1.1 1.25 1.4 1.5 1.75 2];
u=[0 0.01 0.023 0.035 0.056 0.079 0.101 0.114 0.135 0.159 0.172 0.211 0.248];
k=100*u./(30.*uc)
plot(uc,k,'-black'), hold on, grid on,
xlabel('Uc, В')
ylabel('K ')
%% 5.2 tranz
clc
clear all
uc=[0.003:0.003:0.03];
u=[0.120 0.211 0.255 0.294 0.331 0.359 0.380 0.401 0.411 0.420];
k=100*u./(30.*uc)
plot(uc,k,'-black'), hold on, grid on,
xlabel('Uc, В')
ylabel('K ')
%% 5.3 sync
clc
clear all
uc=[0.001,0.01:0.005:0.1];
u=[0 0.001 0.006 0.01 0.013 0.017 0.02 0.023 0.027 0.031 0.034 0.038 0.041 0.044 0.047 0.051 0.053 0.057 0.06 0.065];
k=100*u./(30.*uc)
plot(uc,k,'-black'), hold on, grid on,
xlabel('Uc, В')
ylabel('K ')
%%
fileID = fopen('myfile.txt','w');
nbytes = fprintf(fileID,'% 1.3f\n',k);
fclose(fileID);
type('myfile.txt')