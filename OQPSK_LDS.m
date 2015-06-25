%% Comparision of the spectra of OQPSK, \frac{\pi}{4}-OQPSK and QPSK
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

%%
% This demo compares pdf's of OQPSK, \frac{\pi}{4}-OQPSK and QPSK

N=16; Fd =4; Fs = N * Fd; Delay = 0; Symb =10000; M = 4;
msg_orig = randsrc(Symb,1,[0:M-1],5555);                        % Symbols Generation 

msg_tx1 = oqpskmod(msg_orig);                                   % Modulate Data
[y1, t] = rcosflt(msg_tx1, 2*Fd, Fs,'fir/sqrt',.5);             % 50% root-raised-cosine shaping 

msg_tx2 = qammod(msg_orig,M);                                   % Modulate Data
[y2, t] = rcosflt(msg_tx2, Fd, Fs,'fir/sqrt',.5);               % 50% root-raised-cosine shaping 

msg_tx3 = oqpskmod(msg_orig,pi/4);                              % Modulate Data
[y3, t] = rcosflt(msg_tx3, 2*Fd, Fs,'fir/sqrt',.5);             % 50% root-raised-cosine shaping 

psd_fft    = 1048;                                              % PSD-FFT-Length 
psd_window = kaiser(psd_fft);                                   % PSD Window Function 
f_A        = 1048e5;                                            % Sampling Frequency 

[LDS1,f_vec] = psd(y1,psd_fft,f_A,psd_window);                  % Spectral Estimation
LDS1         = [LDS1((psd_fft / 2 + 1):psd_fft);LDS1(1:(psd_fft / 2))];   
LDS1_dB      = 10 * log10(LDS1*(1/psd_fft));                    % LDS in dB 

[LDS2,f_vec] = psd(y2,psd_fft,f_A,psd_window);                  % Spectral Estimation 
LDS2         = [LDS2((psd_fft / 2 + 1):psd_fft);LDS2(1:(psd_fft / 2))];   
LDS2_dB      = 10 * log10((LDS2*(1/psd_fft)));                  % LDS in dB 

[LDS3,f_vec] = psd(y3,psd_fft,f_A,psd_window);                  % Spectral Estimation
LDS3         = [LDS3((psd_fft / 2 + 1):psd_fft);LDS3(1:(psd_fft / 2))];   
LDS3_dB      = 10 * log10((LDS3*(1/psd_fft)));                  % LDS in dB 

f_vec        = (f_vec - round(max(f_vec)/2))/(Fs*2*(f_A/(psd_fft)));% Shifting the Frequency Vector

%%
%OQPSK
hold on;
plot(f_vec,LDS1_dB-max(LDS1_dB),'r','LineWidth',1.5);
ylabel('Spectrum [dB]  \rightarrow');xlabel('Normalized Frequency (|f-f_c|T)');
grid;
axis([-max(f_vec)/2 max(f_vec)/2 -40 2]);
title('Comparision of the spectra of OQPSK, pi/4-OQPSK and QPSK with 50% root-raised-cosine pulse shaping.');
      
%%
%QPSK
plot(f_vec,LDS2_dB-max(LDS2_dB),'g','LineWidth',1.5);

%%
%pi/4-OQPSK
plot(f_vec,LDS3_dB-max(LDS3_dB),'b','LineWidth',1.5);legend('OQPSK','QPSK','pi/4-OQPSK')

