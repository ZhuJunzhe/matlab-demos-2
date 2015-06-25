%Eye diagram
g1 = .5*erf(sqrt(2/log(2))*pi*fg*(t+.5*T+T))-.5*erf(sqrt(2/log(2))*pi*fg*(t-.5*T+T));
g2 = .5*erf(sqrt(2/log(2))*pi*fg*(t+.5*T-T))-.5*erf(sqrt(2/log(2))*pi*fg*(t-.5*T-T));
g3=g1+g2+g;
%Plotting
subplot(1,1,1);
plot(t,g,'b','LineWidth',1.5);hold on;
grid on;xlabel('Time [10^{-6} X s]');ylabel('Amplitude'); axis([-.1 .1 -.1 1.1]);
title('Eye diagram of TV Text');
plot(t,g1,'b','LineWidth',1.5);hold on;plot(t,g2,'b','LineWidth',1.5);hold on;plot(t,g3,'b','LineWidth',1.5);
hold off;