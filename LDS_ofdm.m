%% PSD od OFDM Signal
% 
% Copyright 2007 Telecommunications Lab
% $Revision: 1.0 $ $Date: 2007/06/21 12:45:07 $

%%
% 
ofdm.n_car   = 64;                % OFDM-Untertraeger
ofdm.n_guard = 64;                % Guardintervall-Laenge
ofdm.n_fft   = 256;               % FFT-Laenge 
psd_fft    = 512;                 % PSD-FFT-Laenge 
psd_window = hanning(psd_fft);    % PSD-Fensterfunktion 
f_A        = 512e6;               % Abtastfrequenz 

% QPSK-Symbole generieren: 
s_sym = (1/sqrt(2))*(sign(randn(2^14,1)) + j * sign(randn(2^14,1))); 

% Spektrum berechnen
r=0.25;														  % Roll-off-Faktor 
ofdm.n_cos  = round(r*(ofdm.n_guard+ofdm.n_fft));   
signal      = ofdm_mod(s_sym,ofdm);               % OFDM-Modulator aufrufen 
[LDS,f_vec] = psd(signal,psd_fft,f_A,psd_window); % Spektralschaetzung 
f_vec       = f_vec - round(max(f_vec)/2);        % Frequenzvektor verschieben
LDS         = [LDS((psd_fft / 2 + 1):psd_fft);LDS(1:(psd_fft / 2))];   
LDS_dB      = 10 * log10(LDS * (ofdm.n_car/ofdm.n_fft)); % LDS in dB berechnen

subplot(2,1,1);
plot(f_vec/1e6,LDS_dB);                            % Spektrum darstellen
ylabel('S_{ss}(f) in dB  \rightarrow');
grid;
axis([-max(f_vec/1e6) max(f_vec/1e6) -80 5]);
title('OFDM Spectrum, 64 carriers, FFT-Length = 256');


N_carr = 16;                                    % Anzahl der Traeger / FFT-Länge

subplot(2,1,2);
hold on;
  for i=2:N_carr,
   sym1(i)=s_sym(i,1);
   sig1    = ifft(sym1,N_carr);                 % Zeitsignal berechnen 
   sig1_w  = [sig1,zeros(1,N_carr*7)];          % Nullen anhaengen 
   spec1_w = fft(sig1_w);                       % Spektrum berechnen 
   omega   = ([0:8*N_carr-1].')/8/N_carr*2; 	% normierte Frequenz 
   plot(abs(spec1_w),'b-');
   sym1(i)=0;
  end
  
  grid;
  axis([0 128 -Inf Inf]);
  set(gca,'XTick',[1:8:256]);
  set(gca,'XTickLabel',([0:1:31]));

  title('Spectrum of OFDM-Symbol');
  hold off;
