%clear memory
clear

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% include some files
# <include>sweep_sigma_toggle.m</include>
# <include>sweep_sigma_uni_rz.m</include>
# <include>manchester_coding_reciever.m</include>
#<include>sweep_sigma_manchester.m</include>

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load package communications
pkg load communications
% define samples_per_bit
samples_per_bit = 100;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Generate a sequence of 10000 random bits
bits = generate_bits(10000);

% Generate a Unipolar NRZ signal from the bit sequence with a high voltage level of 1.2V
signal_1 = unipolar_nrz(bits,1.2);

% define vector time
t = linspace(0, length(signal_1)/samples_per_bit, length(signal_1));

% plot spectral diagram
plot_spectral_domain(signal_1);
% Plot the eye diagram and set the plot limits
eyediagram(signal_1, 300,1,1);
xlim([-0.165, 0.5]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% recieve unipolar nrz
recieved_bits_1 = unipolar_nrz_reciever(signal_1,10000,0.6);
% bit error rate
ber_signal_1 = calculate_ber(bits,recieved_bits_1);
% calculate number of errors
number_of_errors_signal_1 = ber_signal_1 * 10000;
%add noise to tx signal and let sigma = 0.2 to plot the noisy signal
noisy_signal_1 = add_noise(signal_1,0.2,samples_per_bit);
% plot noisy_signal
plot_noisy_signal(noisy_signal_1,samples_per_bit);
% sweep value of sigma
sigma = linspace(0,1.2,10);
ber_values_signal_1 = sweep_sigma(signal_1,0.6,bits,samples_per_bit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%recieve other line coding
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% line code the stream of bits to polar_nrz
signal_2 = polar_nrz(bits,1.2,samples_per_bit);
recieved_bits_2 = polar_nrz_reciever (signal_2,10000,0);

ber_signal_2 = calculate_ber(bits,recieved_bits_2);

number_of_error_signal_2 =ber_signal_2*10000;

noisy_signal_2=add_noise(signal_2,0.2,samples_per_bit);
plot_noisy_signal_polar_rz(noisy_signal_2,samples_per_bit);

% sweep sigma 0 -> 1.2 and calculate ber
ber_values_signal_2=sweep_sigma(signal_2,0,bits,100);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% line code the stream of bits to unipolar return to zero
signal_3 = unipolar_rz(bits,1.2);
% recieve unipolar rz
recieved_bits_3 = unipolar_rz_reciever(signal_3,10000,0.6);
% bit error rate
ber_signal_3 = calculate_ber(bits,recieved_bits_3);
% calculate number of errors
number_of_errors_signal_3 = ber_signal_3 * 10000;
%add noise to tx signal and let sigma = 0.2 to plot the noisy signal
noisy_signal_3 = add_noise(signal_3,0.2,samples_per_bit);
% plot noisy_signal
plot_noisysignal_unipolar_rz(noisy_signal_3,samples_per_bit);
% sweep sigma values from 0 -> 1.2
ber_values_signal_3 = sweep_sigma_uni_rz(signal_3,0.6,bits,samples_per_bit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% line code the stream of bits to bipolar return to zero
signal_4 = bipolar_rz(bits,1.2);
%recieve bipolar rz. note : decision levels is determind inside this function
recieved_bits_4 = bipolar_rz_reciever(signal_4,10000,0,100);
% calculate ber for bipolar rz
ber_signal_4 = calculate_ber(bits,recieved_bits_4);
% calculate number of errors
number_of_errors_signal_4 = ber_signal_4 * 10000;
%add noise to tx signal and let sigma = 0.2 to plot the noisy signal
noisy_signal_4 = add_noise(signal_4,0.2,samples_per_bit);
% plot noisy_signal
plot_noisy_signal_bipolar_rz(noisy_signal_4,samples_per_bit);
% sweep sigma 0 -> 1.2 and calculate ber
ber_values_signal_4 = sweep_sigma_toggle(signal_4,bits,samples_per_bit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% start manchester code
signal_5 = manchester_coding(bits,1.2,samples_per_bit);
recieved_bits_5 = manchester_coding_reciever(signal_5,samples_per_bit);
ber_signal_5 = calculate_ber(bits,recieved_bits_5);
% calculate number of errors
number_of_errors_signal_5 = ber_signal_5 * 10000;
%add noise to tx signal and let sigma = 0.2 to plot the noisy signal
noisy_signal_5 = add_noise(signal_5,0.2,samples_per_bit);
% plot noisy_signal
plot_noisy_signal_manchester(noisy_signal_5,samples_per_bit);
% sweep sigma 0 -> 1.2 and calculate ber
ber_values_signal_5 = sweep_sigma_manchester(signal_5,bits,samples_per_bit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% plot ber_values of unipolar_nrz with sigmas values
figure
hold on
semilogy(sigma,ber_values_signal_1);
semilogy (sigma,ber_values_signal_2);
semilogy(sigma,ber_values_signal_3);
semilogy (sigma,ber_values_signal_4);
semilogy(sigma,ber_values_signal_5);
legend("Unipolar nrz","Polar nrz","Unipolar rz","Bipolar rz","Manchester")
xlabel('Sigma')
ylabel('BER');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BOUNS !!!!!!!!!!!! % sigma = 0.2 0.3 0.4
sigma_bouns = 0.2 : 0.1 : 0.4;
number_of_error_in_recieved_noise_bipolar_rz = detect_number_of_errors(signal_4,sigma_bouns,samples_per_bit,bits);

% ________________________END___________________________________
