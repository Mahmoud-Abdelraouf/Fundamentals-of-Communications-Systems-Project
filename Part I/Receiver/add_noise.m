% function to add noise to the signal with a specified sigma
function noisy_signal = add_noise(signal,sigma,samples_per_bit)
  if nargin < 2
    sigma = 0.2;
  endif
  t = linspace(0, length(signal)/samples_per_bit, length(signal));
  n = sigma * randn(1,length(t));
  noisy_signal = signal + n;
end

