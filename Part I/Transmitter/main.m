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

plot_spectral_domain(signal_2);
% Plot the eye diagram and set the plot limits
eyediagram(signal_2, 300,1,1);
xlim([-0.165, 0.5]);

