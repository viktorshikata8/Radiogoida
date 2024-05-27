%% Модель дискретно-симметричного канала.
clear;
clc;
close all;
B_L = 1e7;
B_s = [1e-2, 1e-3, 1e-4, 1e-5, 1e-6];
for i = 1:length(B_s)
    bitTX = randi([0,1], B_L, 1);% Source
    %% BSC
    CE = rand(B_L, 1);
    bRX = bitTX;
    bRX(CE<=B_s(i)) = 1 - bitTX(CE<=B_s(i));
    NumErr = biterr(bRX, bitTX); % Error Counter
    B_B(i) = NumErr/B_L;
    fprintf('BER with BSC %d\n', B_B(i));
end
loglog(B_s, B_B, '-*', 'LineWidth', 2);
xlabel('Заданная вероятность ошибки');
ylabel('BER');
grid on;
%% Модель с модуляцией и непрерывным каналом.
clear;
clc;
close all;
 
Burst_Length = 1e7;
EbN0 = 0:10;
 
ModulationOrder = 2;
pskModulator = comm.PSKModulator( ...
'ModulationOrder', ModulationOrder, ...
'BitInput', true ...
);
Bits = de2bi(0:ModulationOrder-1, ...
log2(ModulationOrder), 'left-msb').' 
C = pskModulator.step(Bits(:))
 
DepskModulator = comm.PSKDemodulator( ...
'ModulationOrder', ModulationOrder, ...
'BitOutput', true, ...
'DecisionMethod', 'Hard decision' ...
);
Sp = mean((abs(C)).^2);
Spn = Sp / log2(ModulationOrder);
 
 
for i = 1:length(EbN0)
M = length(C);
TXbit = randi([0 M-1],Burst_Length,1);
TXsym = pskModulator.step(TXbit);
rxSig = awgn(TXsym,EbN0(i),Spn); %передача сигнала через AWGN
RXbit = DepskModulator.step(rxSig);
NumErr(i) = size(find([TXbit - RXbit]),1); %error counter
end
simBer = NumErr/Burst_Length;
 
theoryBer = 0.5*erfc(sqrt(10.^(EbN0/10))); 
 
close all
figure
semilogy(EbN0,theoryBer,'b.-');
hold on
semilogy(EbN0,simBer,'mx-');
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB');
ylabel('BER');
%% Модель с кодированием.
clear;
clc;
close all;
Burst_Length = 1e8;
BER_set = logspace(-4, -0.5, 10);
for i = 1:length(BER_set)

bitTX = randi([0,1], Burst_Length, 1);

n = 7;
k = 4;
encBits = encode(bitTX,n,k,'hamming/binary'); % Encoder

%% BSC
CreateError = rand(Burst_Length, 1);
bitRX = encBits;
bitRX(CreateError<=BER_set(i)) = 1-bitTX(CreateError<=BER_set(i));

decodedBits = decode(bitRX,n,k,'hamming/binary'); % Decoder

NumErr = biterr(decodedBits, bitTX);
BER_BSC(i) = NumErr/Burst_Length;
end

figure;
plot(BER_set, BER_BSC, 'LineWidth', 2, 'MarkerSize', 10, 'Marker', '.'); hold on
grid on;
ax = gca;
set(ax, 'XScale', 'log', 'YScale', 'log');
xlabel('BER канала');
ylabel('BER декодера');
ax = gca;
%% Энергетическая эффективность кодирования в непрерывном канале.
clear;
clc;    
close all;
Burst_Length = 16e6;
EbN0 = 0:10;
n = 7;
k = 4;
R = k/n; %Rate
ModulationOrder = 2;
pskModulator = comm.PSKModulator( ...
'ModulationOrder', ModulationOrder, ...
'BitInput', true ...
);
Bits = de2bi(0:ModulationOrder-1, ...
log2(ModulationOrder), 'left-msb').' 
C = pskModulator.step(Bits(:))
DepskModulator = comm.PSKDemodulator( ...
'ModulationOrder', ModulationOrder, ...
'BitOutput', true, ...
'DecisionMethod', 'Hard decision' ...
);
Sp = mean((abs(C)).^2);
Spn = Sp / log2(ModulationOrder);
Spb = Spn/R;
for i = 1:length(EbN0)
M = length(C);
TXbit = randi([0 M-1],Burst_Length,1);
encBits = encode(TXbit,n,k,'hamming/binary');
TXsym = pskModulator.step(encBits);
rxSig = awgn(TXsym,EbN0(i),Spb);
RXbit = DepskModulator.step(rxSig);
decodedBits = decode(RXbit,n,k,'hamming/binary');
NumErr(i) = size(find([TXbit - decodedBits]),1);
end
simBer = NumErr/Burst_Length;
theoryBer = 0.5*erfc(sqrt(10.^(EbN0/10))); 
close all
figure
semilogy(EbN0,theoryBer,'b.-');
hold on
semilogy(EbN0,simBer,'mx-');
grid on
legend('theory', 'simulation');
xlabel('Eb/No, dB');
ylabel('BER');
%% Порождающая и проверочная матрицы линейных блоковых кодов
clear;
clc;
close all;
M = 3;
 
[H, G] = hammgen(M); 
disp(H)
disp(G)
fprintf('Число кодовых символов N: %d\n', size(G, 2));
fprintf('Число кодируемых информационных символов K: %d\n');
size(G, 1)
disp(mod(G*(H.'), 2))% 
W = de2bi(0:2^size(G,1)-1);
T = mod(W*G,2)
%% Циклический код
clear;
clc;
close all;
 
nk = [7 4; 16 11; 23 12; 35 20];
pol = cell(size(nk, 1));
for i = 1:size(nk, 1)
pol{i} = cyclpoly(nk(i, 1), nk(i, 2));
fprintf('(%d, %d): ', nk(i, 1), nk(i, 2));
disp(pol{i});
end
 
n = 23; k = 12;
pol = cyclpoly(n, k);
wt = gfweight(pol, n) 
%% Коды БЧХ.
clc;
clear all;
 
q = 5;
N = 2 ^ q - 1;
 
T = bchnumerr(N);
 
result = zeros(length(T), N);
for i = 1 : length(T)
[genpoly,t] = bchgenpoly(N, T(i, 2));
disp(genpoly.x);
end
%% Недвоичные линейные коды
x1 = 5; 
x2 = 7; 
q = 3; 
g1 = gf(x1,q); 
g2 = gf(x2,q); 
sum = g1 + g2; 
fprintf('sum = %d\n', sum.x); 
prod = g1 * g2; 
fprintf('prod = %d\n', prod.x); 
%%  Циклические (недвоичные) коды Рида-Соломона rsenc
m = 3;  
n = 2^m - 1; 
k = 3; % Message length 
msg = gf([2 7 3; 4 0 6],m) 
code = rsenc(msg,n,k) 
%% Циклические (недвоичные) коды Рида-Соломона rsdec
m = 3; % Number of bits per symbol 
n = 2^m-1; % Codeword length 
k = 3; % Message length 
msg = gf([2 7 3; 4 0 6; 5 1 1],m); 
code = rsenc(msg,n,k); 
errors = gf([2 0 0 0 0 0 0; 3 4 0 0 0 0 0; 5 6 7 0 0 0 0],m); 
noisycode = code + errors; 
[rxcode,cnumerr] = rsdec(noisycode,n,k); 