%% Rayleigh Distribution
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

%%
% 
x = [0:0.01:5];
p = raylpdf_(x);
plot(x,p,'LineWidth',2);
xlabel('x');ylabel('rayleigh(x)');
title('Rayleigh Distribution')
grid on;