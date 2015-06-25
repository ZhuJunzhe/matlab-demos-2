%% Tasksheet 4  exercise 1
  %Author Zhu Junzhe
  % 2556095
%%
close all;
clear all;
c=3*10^8;
k=100;
l=50;
v=10;%m/s
f1=88*10^6;
f2=2*10^9;
f3=2603*10^6; 
t=0:0.5:20;
y=100-v*t;
x=abs(y);
a=atan(x/50)
fd1=v*c/f1*sin(a);
fd1_max=v*c/f1*sin(atan(2));
f_fd1=fd1/fd1_max;
fd2=v*c/f2*sin(a);
fd2_max=v*c/f2*sin(atan(2));
f_fd2=fd2/fd2_max;
fd3=v*c/f3*sin(a);
fd3_max=v*c/f3*sin(atan(2));
f_fd3=fd3/fd3_max;
plot(t,fd1,'r',t,fd2,'*g',t,fd3,'--b');
xlabel('time');ylabel('fd');
figure
plot(t,f_fd1,'r',t,f_fd2,'*g',t,f_fd3,'--b');
xlabel('time');ylabel('fd/(f_max)');
title('doppler effect');



