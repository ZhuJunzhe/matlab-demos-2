%% The lognormal distribution
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $
sigma = 1;
mu1 = 1;
mu2 = 2;

s=sqrt(mu1.^2 + mu2.^2);

amp_dB = -20:0.5:6;

r=0:0.01:7;
p = (r/sigma.^2).*(exp(-(r.^2 + s.^2)/(2.* sigma^2))).* besseli(0,((r.*s)/sigma.^2));

p1 = (r/sigma.^2 ).* exp(-(r.^2/(2.*sigma.^2)));


plot(r, p, r, p1);
title('Rice Distribution')
xlabel('r')
axis([0 6 0 0.7])
ylabel('p(r)')
legend('K=6.5 dB', 'K=-\infty dB');
grid on;