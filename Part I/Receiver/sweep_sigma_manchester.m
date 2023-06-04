function ber_values = sweep_sigma_manchester(signal,bits,samples_per_bit)
   N=10000;
   % sigma = linspace(0,1.2,10);
     sigma = linspace(0,1.4,10);
    t = linspace(0, length(signal)/samples_per_bit, length(signal));
    ber_values = zeros(1, 10);
for i = 1:10
    % Add noise to the received signal

    n = sigma(i) .* randn(1,length(t));
    noisy_signal = signal + n;

    % Decode
    index = 1;
    received_bits_noise = zeros(1,N);
    received_bits_noise = manchester_coding_reciever(noisy_signal,samples_per_bit);
    % Calculate BER
    ber_values(i) = calculate_ber(bits, received_bits_noise);
end
end
