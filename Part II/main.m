%%%%%%%%%%%%%%%%%%%%%%%%% Start Of Main %%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all; close all;
# <include>generate_bits.m</include>
# <include>line_code.m</include>
# <include>decision.m</include>
# <include>calculate_ber.m</include>


fc = 1e9;       % Carrier frequency
Tb = 10/fc;     % bit time
Rb = 1/Tb;      % bit rate
ts = Tb/200;    % sampling time
numOfBits = 100;  % no. of bits
%%%%%%%%%%%%%%%%%%%%%% Part II Transmitter %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% 1) Generate stream of random bits %%%%%%%%%%%%%%%%%
rand_bits = generate_bits(numOfBits);
t_bits = linspace(0,Tb*numOfBits,numOfBits);

% Graph 100 random bits
figure
stairs(t_bits, rand_bits);
axis([0 t_bits(end) -0.5 1.5]);

%%%%%%%%%%%%%%%%%%%%%%%% 2) Polar NRZ coding %%%%%%%%%%%%%%%%%%%%%%%%%

line_coded_bits = line_code(rand_bits, 1, -1);
Ns = length(line_coded_bits);
time = 0:ts:ts*(Ns-1);


figure
plot(time,line_coded_bits);
axis([0 length(line_coded_bits)*ts -1.5 1.5]);
xlabel("Time");
ylabel("Line coded bits");

%%%%%%%%%%%%%%%%%%% 3) Plotting the spectral domain %%%%%%%%%%%%%%%%%%%

df = 1/(Ns*ts);
fs = 1/ts;
N = length(time);
f = (-0.5*fs):df:(0.5*fs-df);
% Calculate the spectrum
line_coded_spectrum = abs((fftshift(fft(line_coded_bits)).^2)/N);

figure
plot(f, line_coded_spectrum);
axis([-6e8 6e8 0 max(line_coded_spectrum)+20]);
xlabel("Frequency");
ylabel("line_coded_power_spectrum");

%%%%%%%%%%%%%%%%%% 4) BPSK modulation time domain %%%%%%%%%%%%%%%%%%%
carrier = sin(2*pi*fc*time);      % carrier is a sine wave
BPSK_modulated_signal = line_coded_bits.*carrier; % modulating the signal

% plotting BPSK_modulated_signal
figure
plot(time, BPSK_modulated_signal);
axis([0 10/fc -1.5 1.5]);
xlabel("Time");
ylabel("BPSK_modulated_signal");

%%%%%%%%%%%%%%%%%%%% 5) Plotting BPSK spectrum %%%%%%%%%%%%%%%%%%%%%%
BPSK_spectrum = abs(fftshift(fft(BPSK_modulated_signal)));
figure
plot(f, BPSK_spectrum);
xlabel("frequency");
ylabel("BPSK_spectrum");

%%%%%%%%%%%%%%%%%%%%%%%% Part II Receiver %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%% 6) BPSK demodulation %%%%%%%%%%%%%%%%%%%%%%%%%
BPSK_demodulated_signal = BPSK_modulated_signal.*carrier;
y=[];
for index = 1:200:length(BPSK_demodulated_signal);
  y = [y trapz(time(index:index+199), BPSK_demodulated_signal(index:index+199))];
end

figure
reconstructed_bits = line_code(decision(y),1,-1);
plot(time, reconstructed_bits);
axis([0 length(line_coded_bits)*ts -1.5 1.5]);
xlabel("Time");
ylabel("rec");

%%%%%%%%%%%%%%%%%%%%%% 7) Calculate BER %%%%%%%%%%%%%%%%%%%%%%%%%
BER = calculate_ber(line_coded_bits, reconstructed_bits)

%%%%%%%%%%%%%%%%%%%%%%%%% End Of Main %%%%%%%%%%%%%%%%%%%%%%%%%%%

