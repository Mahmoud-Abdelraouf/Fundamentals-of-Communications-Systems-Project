function recieved_bits = manchester_coding_reciever(signal,sampling_per_bit)
  N =10000;

  index = 1;
recieved_bits = zeros(1,N);
for i=1:N
  if(signal(index) >= 0)
    recieved_bits(i) = 1;
    index = index + sampling_per_bit;
  else
    recieved_bits(i) = 0;
    index = index + sampling_per_bit;
  end
end
end

