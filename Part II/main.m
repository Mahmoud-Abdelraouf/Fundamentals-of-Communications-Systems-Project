clear all; close all;
# <include>generate_bits.m</include>
# <include>line_code.m</include>
# <include>decision.m</include>
# <include>calculate_ber.m</include>
fc = 1e9; % Carrier frequency
Tb = 10/fc; % bit time
Rb = 1/Tb; % bit rate
ts = Tb/200; % sampling time
numOfBits = 100; % no. of bits
%%%%%%%%%%%%%%%%%%%%%% Part II Transmitter %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% 1) Generate stream of random bits %%%%%%%%%%%%%%%%%
rand_bits = generate_bits(numOfBits);
t_bits = linspace(0,Tb*numOfBits,numOfBits);
% Graph 100 random bits
figure
stairs(t_bits, rand_bits);
title("Generated bits");
xlabel("n_bits");
ylabel("bits");
axis([0 t_bits(end) -0.5 1.5]);
%%%%%%%%%%%%%%%%%%%%%%%% 2) Polar NRZ coding %%%%%%%%%%%%%%%%%%%%%%%%%
line_coded_bits = line_code(rand_bits, 1, -1);
Ns = length(line_coded_bits);
time = 0:ts:ts*(Ns-1);
figure
plot(time,line_coded_bits);

axis([0 length(line_coded_bits)*ts -1.5 1.5]);
title("Polar NRZ");
xlabel("Time");
ylabel("Line coded bits");
%%%%%%%%%%%%%%%%%%% 3) Plotting the spectral domain %%%%%%%%%%%%%%%%%%%
df = 1/(Ns*ts);
fs = 1/ts;
N = length(time);
f = (-0.5*fs):df:(0.5*fs-df);
% Calculate the spectrum
line_coded_spectrum = abs((fftshift(fft(line_coded_bits)))/N);
line_coded_power_spectrum = abs((fftshift(fft(line_coded_bits))).^2/N);
figure
plot(f, line_coded_spectrum);
title("Polar NRZ spectrum");
xlabel("Frequency");
ylabel("line_coded_spectrum");
figure
plot(f, line_coded_power_spectrum);
title("Polar NRZ power spectrum");
xlabel("Frequency");
ylabel("line_coded_power_spectrum");
%%%%%%%%%%%%%%%%%% 4) BPSK modulation time domain %%%%%%%%%%%%%%%%%%%
% carrier is a sine wave should be multiplied by sqrt(2/Tb)
carrier = sqrt(2/Tb)*sin(2*pi*fc*time);

BPSK_modulated_signal = line_coded_bits.*carrier; % modulating the signal
% plotting BPSK_modulated_signal
figure
plot(time, BPSK_modulated_signal);
axis([0 10/fc -15000 15000]);
title("BPSK modulated signal");
xlabel("Time");
ylabel("BPSK_modulated_signal");
%%%%%%%%%%%%%%%%%%%% 5) Plotting BPSK spectrum %%%%%%%%%%%%%%%%%%%%%%
BPSK_spectrum = abs(fftshift(fft(BPSK_modulated_signal)));
figure
plot(f, BPSK_spectrum);
title("BPSK Modulated signal spectrum");
xlabel("frequency");
ylabel("BPSK_spectrum");
%%%%%%%%%%%%%%%%%%%%%%%% Part II Receiver %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% 6) BPSK demodulation %%%%%%%%%%%%%%%%%%%%%%%%%
BPSK_demodulated_signal = BPSK_modulated_signal.*carrier;

BPSK_demodulated_spectrum = fftshift(fft(BPSK_demodulated_signal))/Ns;
figure
plot(f, abs(BPSK_demodulated_spectrum));
title("BPSK_demodulated_spectrum");
xlabel("frequency");
ylabel("BPSK_demodulated_spectrum");

BPSK_demodulated_spectrum_power = abs(fftshift(fft(BPSK_demodulated_signal)).^2/Ns);
figure
plot(f, BPSK_demodulated_spectrum_power);
title("BPSK_demodulated_spectrum_power");
xlabel("frequency");
ylabel("BPSK_demodulated_spectrum_power");


LPF = abs(f)<Rb;
BPSK_LPF = BPSK_demodulated_spectrum .* LPF;
figure
plot(f, abs(BPSK_LPF));
title("BPSK after LPF spectral");
xlabel("frequency");
ylabel("BPSK after LPF spectral");

BPSK_LPF_time = real(ifft(ifftshift(BPSK_LPF))*Ns);
figure
plot(f, BPSK_LPF_time);
title("BPSK after LPF time domain");
xlabel("time");
ylabel("BPSK LPF signal");

reconstructed_bits = decision(BPSK_LPF_time);
figure
plot(time, reconstructed_bits);
title("reconstructed bits after LPF and demodulation");
ylabel("reconstructed_bits");
xlabel("time");
%%%%%%%%%%%%%%%%%%%%%% 7) Calculate BER %%%%%%%%%%%%%%%%%%%%%%%%%
transimitted_bits = line_code(rand_bits, 1,0);
BER = calculate_ber(transimitted_bits, reconstructed_bits)
%%%%%%%%%%%%%%%%%%%%%%%%% End Of Main %%%%%%%%%%%%%%%%%%%%%%%%%%%
