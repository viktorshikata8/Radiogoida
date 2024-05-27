clear all
clc
Ucm=[44.3 44 43.6 42.9 42.7 42.5 41.95 41.6 41.1 40.7 ];
upitt=[62.4 60.5 58.1 56.1 55.3 54.2 52.1 50.6 48.7 46.7] ;
Icp=[26 18.5 17 15 14.9 13 11.5 11 9 3]*0.001;

Pout=[400 350 300 215 200 190 110 95 22 0]*10^-4;
Pin=Ucm.*Icp;
F=[8789 8723 8666 8647 8641 8625 8599 8587 8580 ];
 kpd=(Pout./Pin)*100;
  plot(upitt,kpd)

 % plot(Icp,F)