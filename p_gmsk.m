clear all;
close all;
ES_N_dB=[1:40];
ES_N_lin=10.^(0.1*ES_N_dB);

p_e_psk_=0.5*erfc(sqrt(ES_N_lin));
p_e_psk=10*log10(p_e_psk_);

p_e_msk_=erfc(sqrt(ES_N_lin));
p_e_msk=10*log10(p_e_msk_);


ES_M_gmsk=[1 2 3 4 5 6 7 8 9 10 11 12 13]
p_e_gmsk= [-9.5 -11 -13 -15.5 -18 -21.5 -26 -32 -39 -48 -57 -67 -78]


figure;
plot(ES_N_dB,p_e_psk,ES_N_dB,p_e_msk,'LineWidth',1.5);hold on;
plot(ES_M_gmsk,p_e_gmsk,'r','LineWidth',1.5);

legend('2 PSK','MSK','GMSK')%,'4 PSK approx','8 PSK approx','16 PSK approx','32 PSK approx')
title('BER')
xlabel('E_S/N in[dB]')
axis([1 20 -80 0])
ylabel('p_M Probability of error in dB')
grid on;