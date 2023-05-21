% function to sweep values of sigma and calculate ber for each value of sigma
function ber_values = sweep_sigma(signal,decision,bits,samples_per_bit)
    N=10000;
    sigma = linspace(0,1.2,10);

    t = linspace(0, length(signal)/samples_per_bit, length(signal));
    ber_values = zeros(1, 10);
for i = 1:10
    % Add noise to the received signal

    n = sigma(i) .* randn(1,length(t));
    noisy_signal = signal + n;

    % Decode
    index = 1;
    received_bits_noise = zeros(1,N);
    for j = 1:N
        if noisy_signal(index) >= decision
            received_bits_noise(j) = 1;
            index = index + 100;
        else
            received_bits_noise(j) = 0;
            index = index + 100;
        end
    end
    % Calculate BER
    ber_values(i) = calculate_ber(bits, received_bits_noise);
end
  end

