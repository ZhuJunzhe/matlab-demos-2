%% Spectrum Analysis of MSK
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

%%
% 
f=[-40:.001:40];
T=1;

SV= T*((sinc(2*f*T + 0.5)+sinc(2*f*T-0.5)).^2);
subplot(1,1,1);
semilogy(f, SV, 'b', 'LineWidth',1.5);

title('S_v(f) with T=1')
axis([-2 2 0.001 1])
ylabel('S_v(f)')
grid on;