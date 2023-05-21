% it is a function that calculate BER
% it takes two parmeters tx_bits
% tx_bits -> stream of bits of the transmitter
% rx_bits -> stream of bits of the Reciever
function BER = calculate_ber(tx_bits,rx_bits)
  % calculate number of error bits
  number_of_error_bits = sum(tx_bits ~= rx_bits);
  % calculate bit error rate
  BER = number_of_error_bits / length(tx_bits);
end
% important !!!!
% we have to calculate number of error in the main
% use this formula
% number_of_error_bits = BER * length(tx_bits);

