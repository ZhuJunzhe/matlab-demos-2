close all;
clear all;

n=[0:.001:60];

tau=0.8;

y1 = (2^(1-tau)).^n;
y2 = 2*(n.^2)*(1-tau);
y=y1-y2;

figure;
plot(n,y);
title('(2^{(1-r)})^n - 2n^2(1-r)   r=0.8')
axis([0 55 -400 1000])
xlabel('n');ylabel('Ratio between codetable and syndrome decoding')