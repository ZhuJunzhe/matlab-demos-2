function y = raylpdf_(x)
%% Rayleigh PDF with sigma = 1
sigma = 1;
l=length(x);
y = zeros(1,l);
for k = 1:l
    y(k) = x(k)/sigma^2 * exp(-(x(k)^2)/(2*sigma^2));
end;
