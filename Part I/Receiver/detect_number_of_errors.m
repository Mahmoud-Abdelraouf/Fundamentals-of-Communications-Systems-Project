function number_of_errors = detect_number_of_errors(signal,sigma,samples_per_bit,bits)
  number_of_errors = zeros(1,length(sigma));
  for i=1:length(sigma)
    noisy_signal = add_noise(signal,sigma(i),samples_per_bit);
    recieved_bits = bipolar_rz_reciever(noisy_signal,10000,0,100);
    ber_noise_bipolar_rz = calculate_ber(bits,recieved_bits);
    number_of_errors(i) = ber_noise_bipolar_rz*10000;
  endfor
end

