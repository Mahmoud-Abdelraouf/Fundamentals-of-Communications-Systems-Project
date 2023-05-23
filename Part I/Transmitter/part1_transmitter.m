% Load the Communications Toolbox package
pkg load communications

% Generate a sequence of 10000 random bits
bits = generate_bits(10000);

% Generate a Unipolar NRZ signal from the bit sequence with a high voltage level of 1.2V
signal_1 = unipolar_nrz(bits,1.2);

%check polar_nrz
signal_2 = polar_nrz(bits,1.2);

%check unipolar_rz
signal_3 = unipolar_rz(bits,1.2);

%check bipolar_rz
signal_4 = bipolar_rz(bits,1.2);

%check manchester_coding
signal_5 = manchester_coding(bits,1.2);

%plot the spectral domain of Unipolar NRZ
plot_spectral_domain(signal_1);
%plot the spectral domain of polar NRZ
plot_spectral_domain(signal_2);
%plot the spectral domain of Unipolar RZ
plot_spectral_domain(signal_3);
%plot the spectral domain of Bipolar RZ
plot_spectral_domain(signal_4);
%plot the spectral domain of Manchester Coding
plot_spectral_domain(signal_5);

%Plot the eye diagram of Unipolar NRZ
eyediagram(signal_1, 300,1,1);
xlim([-0.165, 0.5]);
%Plot the eye diagram of polar NRZ
eyediagram(signal_2, 300,1,1);
xlim([-0.165, 0.5]);
%Plot the eye diagram of Unipolar RZ
eyediagram(signal_3, 300,1,1);
%Plot the eye diagram of Bipolar RZ
eyediagram(signal_4, 300,1,1);
%Plot the eye diagram of Manchester Coding
eyediagram(signal_5, 300,1,1);



