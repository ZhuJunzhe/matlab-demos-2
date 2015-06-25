%% Cosine Roll-Off Pulse Shaping
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

%%
% 
Fs = 500000;                              % Sampling frequency 50000 Hz
T = 1/1000;                               % Symbol time interval [s].
t = -5*T:1/Fs:5*T;                        % Time vector (sampling intervals)
t = t+0.00000001;                         % Otherwise, the denominator would be zero at t=0
f= 0:1/Fs:2;
alpha = 0.25;                             % Roll-off factor

% Raised-Cosine FIR filter
for k=1:4
p(k,:) = (sin(pi*t/T)./(pi*t/T)).*(cos(alpha*pi*t/T)./(1-(2*alpha*t/T).^2)); 
alpha=alpha+0.25;
end

% Plotting

subplot(1,2,1);plot(t,p(1,:),'r',t,p(2,:),'b',t,p(3,:),'g',t,p(4,:),'--','LineWidth',1.5);hold on;grid on;xlabel('Time [s]');ylabel('Amplitude');
legend('r=0.25','r=0.5','r=0.75','r=1');title('Cosine-Roll-Off');

% Cosine-Roll-Off frequency response
alpha = 0.25;
for i=1:4
P(i,:)=abs(fft([p(i,:) zeros(1,1024-length(p(i,:)))]));
alpha=alpha+0.25;
end

% Plotting
subplot(1,2,2);plot(P(1,:)/max(P(1,:)),'r','LineWidth',1.5);hold on;plot(P(2,:)/max(P(2,:)),'b','LineWidth',1.5);hold on;plot(P(3,:)/max(P(3,:)),'g','LineWidth',1.5);hold on;plot(P(4,:)/max(P(4,:)),'--','LineWidth',1.5);
legend('r=0.25','r=0.5','r=0.75','r=1');title('Cosine-Roll-Off in Frequency Domain');
hold on;
axis([0 16 -.1 1.1]);
set(gca,'XTick',[0:6:16]);
set(gca,'XTickLabel',['     0';'1 / 2T';'1 / T ';'      ';'      ';'      ';'      '])
f(1:length(P(1,:)))=0;
line(1:length(f),f,'color','k');
grid on;
hold off;