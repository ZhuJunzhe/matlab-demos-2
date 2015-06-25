close all;
clear all;

Fd=8000; Fs=64000; T=1/Fd; Delay=5; R=0;

% Plot p(t)
t=-20*T:1/Fs:20*T;
t=t+eps; % otherwise, the denominator would be zero at t=0 

for k=1:3
[y(k,:), t] = rcosflt(1, Fd, Fs, 'fir/root', R, Delay);
R=R+0.5;
end;

figure;
plot(t,y(1,:),'r',t,y(2,:),'g',t,y(3,:),'b','LineWidth',1.5);axis([0 1.25*10^(-3) -0.3 1.1]);
legend('r=0.0','r=0.5','r=1.0');title('Root Cosine-Roll-Off');

for i=1:3
Y(i,:)=abs(fft(y(i,:)'.*(hamming(length(y(i,:))))));
end;
figure;
plot(Y(1,:)/max(Y(1,:)),'r','LineWidth',1.5);hold on;
plot(Y(2,:)/max(Y(2,:)),'b','LineWidth',1.5);hold on;
plot(Y(3,:)/max(Y(3,:)),'g','LineWidth',1.5);hold on;
axis([0 15 0 1]);
legend('r=0.0','r=0.5','r=1.0');title('Root Cosine-Roll-Off in Frequency Domain');