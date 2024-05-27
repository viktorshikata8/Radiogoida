close all;
clear all;
clc;

Fpwm = 80e3; % ������� ���
delay_0 = 10e-9; % �������� �������� ��� ������������
delay_0_h = 1/Fpwm/delay_0;
V_in = 10; % ���������� ��������� �����������, ������� ���������� �����������

a=2*pi;
NT=2^18+1; %    ���������� ���������� �������� (������ ������� 2)+1
step=2*pi/NT; % ��� ������������������ ��������� �������
delay_p = round(NT/delay_0_h);
r_step = 1/80e3/NT;

t = zeros(1, NT);
V = zeros(1, NT);
x = zeros(1, NT);
Sig = zeros(1, NT);
tx = zeros(1, NT);
    
for k=1:NT
    
    t(k)=(k-1)*(step);
   
    x(k)= 0.9+0*t(k); % ������� ������; ���������� �� ��������� 0...2pi ��� ������������������
    tt=t(k);
    tx(k) = k*r_step;

    V(k)=reference_voltage_stud(tt,a); % ������� ����������
    Sig(k)=(1+sign(x(k)-V(k)))/2; % ������������ ���-������������������

end

Sig_inv = -1*(Sig-1); % ��������������� ���

for k=2:NT

    if (Sig_inv(k)==1) && (Sig_inv(k-1)==0)
        g_0_1 = k;
    elseif (Sig_inv(k)==0) && (Sig_inv(k-1)==1)
        g_1_0 = k;
    end
end

% ������������ �������� ���������� ��� ������� ����������� � ������
% ��������� ���������
if (g_1_0-g_0_1)>0
    Sig_inv(1, g_0_1:1:g_0_1+delay_p) = 0;
    Sig_inv(1, g_1_0-delay_p:1:g_1_0) = 0;
else
    Sig_inv = 0;
end

Sig = Sig*V_in;
Sig_inv = Sig_inv*V_in;

tout=t/(2*pi); 
figure; plot(tx, Sig, tx, Sig_inv) % �������� ������������ �������� ����������
grid on

cnt = length(Sig);
fold_parent = 'D:\mc12\DATA'; % ���������� ������ ���� � �������� �����������, � ������� ����� ������������ ����
    
    mkdir(fold_parent);
    fileID = fopen([fold_parent, '\CH',num2str(1),'.usr'],'w');    
    fprintf(fileID,'%s\n','[Main]', 'FileType=USR', 'Version=2.00', 'Program=Micro-Cap', '');
    fprintf(fileID,'%s\n','[Menu]', 'WaveformMenu=Label vs T');
    fprintf(fileID,'%s\n','[Waveform]', 'Label=Label vs T', 'MainX=T', 'LabelX=T', 'LabelY=v(2)', 'Format=SimpleNoX');
    fprintf(fileID,'%s%s\n', 'Data Point Count=', num2str(cnt));

    A = [tx; Sig];
    fprintf(fileID,'%E %E\n',A);
    fclose(fileID);
    
fold_parent = 'D:\mc12\DATA'; % ���������� ������ ���� � �������� �����������, � ������� ����� ������������ ����
    mkdir(fold_parent);
    fileID = fopen([fold_parent, '\CH',num2str(2),'.usr'],'w');    
    fprintf(fileID,'%s\n','[Main]', 'FileType=USR', 'Version=2.00', 'Program=Micro-Cap', '');
    fprintf(fileID,'%s\n','[Menu]', 'WaveformMenu=Label vs T');
    fprintf(fileID,'%s\n','[Waveform]', 'Label=Label vs T', 'MainX=T', 'LabelX=T', 'LabelY=v(2)', 'Format=SimpleNoX');
    fprintf(fileID,'%s%s\n', 'Data Point Count=', num2str(cnt));

    A = [tx; Sig_inv];
    fprintf(fileID,'%E %E\n',A); 
    fclose(fileID);



