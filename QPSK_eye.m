%% QPSK- Eye- and Scatterdiagramm
yy = y(1+Delay*N:end-Delay*(N+2));
h3 = eyediagram(yy, N);

h7 = scatterplot(yy, 1, 0, 'c-');
hold on;
scatterplot(yy, N, 0, 'b.',h7);
hold off;
