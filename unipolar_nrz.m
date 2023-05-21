% UNIPOLAR_NRZ Generates a unipolar non-return-to-zero (NRZ) signal from a
% sequence of bits.
%
%   signal = unipolar_nrz(bits, high_voltage_level, samples_per_bit)
%
%   Arguments:
%   - bits: A row vector of binary values (0 or 1) representing the input bit
%           stream.
%   - high_voltage_level: The voltage level used to represent a logic high (1)
%                          value.
%   - samples_per_bit: The number of samples per bit used to generate the
%                      output signal. Default value is 100.
%
%   Returns:
%   - signal: A row vector representing the output signal.
%
%   The function generates a unipolar NRZ signal by mapping each input bit to
%   a voltage level. A logic high (1) value is mapped to the high voltage
%   level, and a logic low (0) value is mapped to the ground voltage level.
%   The output signal is generated by repeating each mapped voltage level for
%   a specified number of samples per bit.
%
%   Example usage:
%   >> bits = [1 0 1 1 0];
%   >> high_voltage_level = 5;
%   >> samples_per_bit = 50;
%   >> signal = unipolar_nrz(bits, high_voltage_level, samples_per_bit);
%   >> plot(signal);
%
function signal = unipolar_nrz(bits, high_voltage_level, samples_per_bit)
    % Check the input arguments
    if nargin < 3
        samples_per_bit = 100;
    end

    % Initialize the output signal
    signal = zeros(1, length(bits)*samples_per_bit);

    % Set the voltage level
    v_low = 0;
    v_high = high_voltage_level;

    % Generate the signal
    for i = 1:length(bits)
        if bits(i) == 1
            signal((i-1)*samples_per_bit+1:i*samples_per_bit) = v_high;
        else
            signal((i-1)*samples_per_bit+1:i*samples_per_bit) = v_low;
        end
    end

    % Create a new figure
    figure();

    % Create the time axis
    t = linspace(0, length(signal)/samples_per_bit, length(signal));

    % Plot the signal
    plot(t, signal);
    axis([0 t(end) -0.1*high_voltage_level 1.1*high_voltage_level]);

    % Add grid and labels
    grid on;
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    title('Unipolar NRZ Signal');
end