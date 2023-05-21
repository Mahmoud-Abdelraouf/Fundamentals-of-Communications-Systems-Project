% function to extract stream of bits in reciever


function recieved_bits = unipolar_nrz_reciever(signal,N,decision)
  index = 1;
if nargin <2
    decision = 0.6;
end
recieved_bits = zeros(1,N);
for i=1:N
  if(signal(index) >= decision)
    recieved_bits(i) = 1;
    index = index+100;
  else
    recieved_bits(i) = 0;
    index = index + 100 ;
  end
end
end

