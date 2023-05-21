% function to add noise to the waveform using sihma value
% parameters
% waveform ---> the waveform which we will add noise to
% sigma ---> Rms noise value

function noise_signal = add_noise(waveform,sigma,time_vector)
  %calculate noise
  n = sigma * randn(1,length(time_vector));
  % add noise to the waveform
  noise_signal = waveform + n;
end

