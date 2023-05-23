% it is a function that calculate BER
% it takes two parmeters tx_bits
% tx_bits -> stream of bits of the transmitter
% rx_bits -> stream of bits of the Reciever
function BER = calculate_ber(tx_bits,rx_bits)
  NumOfErrors = 0;
  for index = 1:length(tx_bits);
    if tx_bits(index) != rx_bits(index)
      NumOfErrors = NumOfErrors +1;
    endif
  endfor
  BER = NumOfErrors/length(tx_bits);
end


