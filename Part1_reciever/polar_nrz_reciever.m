% function to extract stream of bits in reciever polar nrz

function recieved_bits = polar_nrz_reciever(signal_2,N,decision)
   index=50;
if nargin <3
     decision = 0;
end
  recieved_bits = zeros(1,N);
  for i=1:N
    if(signal_2(index)>=decision)
    recieved_bits(i)=1;
    index = index +100;
  else
    recieved_bits(i)=0;
     index = index +100;
 end
 end
end


