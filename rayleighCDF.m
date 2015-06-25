%% Rayleigh Cummulative Density Function
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

r = 0:0000.1:5;

sigma = 1;
P1 = 1 - exp(-(r.^2/(2*sigma.^2)));

sigma = 2;
P2 = 1 - exp(-(r.^2/(2*sigma.^2)));

sigma = 3;
P3 = 1 - exp(-(r.^2/(2*sigma.^2)));

sigma = 0.5;
P05 = 1 - exp(-(r.^2/(2*sigma.^2)));


plot(r, P1, r, P2, r, P3, r, P05);
title('Rayleigh Cummulative Distribution Function')
xlabel('r')
legend('P(r) with \sigma=1', 'P(r) with \sigma=2', 'P(r) with \sigma=3', 'P(r) with \sigma=0.5');
ylabel('P(r)')
grid on;