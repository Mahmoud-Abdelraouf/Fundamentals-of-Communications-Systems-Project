% unipolar_rz() generates a unipolar RZ (return to zero) pulse waveform from
% a sequence of binary values (0 or 1).
%
% Usage: signal = unipolar_rz(bits, high_voltage_level, low_voltage_level, samples_per_bit)
%
% Input arguments:
%   bits - A vector of binary values (0 or 1) representing the sequence of
%          bits to be encoded into a unipolar RZ signal.
%   high_voltage_level - The voltage level for a logic high bit.
%   low_voltage_level - The voltage level for a logic low bit.
%   samples_per_bit - The number of samples per bit in the generated waveform.
%                     This is an optional argument. The default value is 100.
%
% Output:
%   signal - A vector representing the generated waveform. The waveform is
%            a unipolar RZ pulse waveform with the specified voltage levels and
%            number of samples per bit.
%
% Example usage:
%   % Generate a unipolar RZ signal from a sequence of bits
%   bits = [1 0 1 0 1];
%   high_voltage_level = 3;
%   low_voltage_level = 0;
%   samples_per_bit = 100;
%   signal = unipolar_rz(bits, high_voltage_level, low_voltage_level, samples_per_bit);
%
% The `unipolar_rz()` function generates a unipolar RZ pulse waveform by computing
% the pulse width based on the `samples_per_bit` input argument. The function then
% iterates over each bit in the binary sequence and sets the amplitude of the
% waveform accordingly. For a logic high bit, the amplitude is set to `high_voltage_level`
% for the first half of the pulse and 0 for the second half. For a logic low bit,
% the amplitude is set to 0 for the entire duration of the bit.
%
% The generated waveform is returned as a vector of voltage samples, and it
% is also plotted using the `plot()` function within the `unipolar_rz()`
% function. The `axis()` function is used to set the axis limits based on
% the voltage levels. The function also adds grid and labels to the plot.
%
% The `samples_per_bit` argument is optional and has a default value of 100.
% If `samples_per_bit` is not provided, the default value will be used.
%
% In the example usage, the function is called with a vector of binary bits, and
% the high and low voltage levels are specified. The number of samples per bit
% is also provided, but this is optional. The generated waveform is plotted
% using the `plot()` function within the `unipolar_rz()` function, and it is also returned as the output of the function.

function y = unipolar_rz(bits, high_voltage_level, samples_per_bit)
% Bipolar RZ encoding of a binary sequence
% bits: input binary sequence (row vector)
% high_voltage_level: amplitude of the high voltage level for a logic high bit
% samples_per_bit: number of samples per bit

% Check the input arguments
if nargin < 3
    samples_per_bit = 100;
end

% Compute the number of samples in the waveform
num_samples = length(bits) * samples_per_bit;

% Create a waveform vector of zeros
waveform = zeros(1, num_samples);

% Compute the pulse width for the RZ pulse
pulse_width = samples_per_bit / 2;


% Generate the RZ pulse waveform
for i = 1:length(bits)
    if bits(i) == 1
        % Set the amplitude to high voltage level for a logic high bit    
        waveform((i-1)*samples_per_bit + 1:(i-1)*samples_per_bit + pulse_width) = high_voltage_level;         
        waveform((i-1)*samples_per_bit + pulse_width + 1:i*samples_per_bit) = 0;
    else
        % Set the amplitude to zero for a logic low bit
        waveform((i-1)*samples_per_bit + 1:i*samples_per_bit) = 0;
    end
end

% Create a new figure
figure();

% Create the time axis
t = linspace(0, length(waveform)/samples_per_bit, length(waveform));

% Plot the signal
plot(t, waveform);
axis([0 t(end) -.1*high_voltage_level 1.1*high_voltage_level]);

% Add grid and labels
grid on;
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Unipolar RZ Signal');

% Return the generated waveform
y = waveform;
end