function recieved_bits = bipolar_rz_reciever(signal,N,decision,samples_per_bit)
index = 1;
 if nargin <2
    decision = 0;
end
recieved_bits = zeros(1,N);
for i=1:N
  if(signal(index) > -0.6 && signal(index) < 0.6)
    recieved_bits(i) = 0;
    index = index+samples_per_bit;
  else
    recieved_bits(i) = 1;
    index = index + samples_per_bit ;
  end
end

end
