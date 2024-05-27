lyambda=3*10^8/(1.6*10^9)
a=-2:pi/1000:2*pi;
l=3*lyambda/2
k=2*pi/lyambda
f=(cos(k.*l.*cos(a))-cos(k.*l))./(sin(a));
%%
polarplot(a,f)
