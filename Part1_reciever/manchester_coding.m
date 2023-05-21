function output_signal = manchester_coding(bits, high_voltage, sampling_per_bit)
    % SPLIT_PHASE_ENCODING Encode a sequence of binary bits using Split Phase (Manchester) encoding
    %
    % INPUTS:
    %   bits: a vector of binary bits to be encoded (1s and 0s)
    %   high_voltage: the voltage level for a logic high bit
    %   low_voltage: the voltage level for a logic low bit
    %   sampling_per_bit: the number of samples per bit
    %
    % OUTPUTS:
    %   output_signal: a vector containing the Split Phase (Manchester) encoded signal

    % Check the input arguments
    if nargin < 3
        sampling_per_bit = 100;
    end

    % Compute the number of samples in the waveform
    num_samples = length(bits) * sampling_per_bit;

    % Initialize the output signal
    output_signal = zeros(1, num_samples);

    % Compute the pulse width for the Manchester pulse
    pulse_width = sampling_per_bit / 2;

    % Generate the Manchester pulse waveform
    for i = 1:length(bits)
        if bits(i) == 1
            % Encode a "1" bit as a positive pulse followed by a negative pulse
            output_signal((i-1)*sampling_per_bit + 1:(i-1)*sampling_per_bit+ pulse_width) = high_voltage;
            output_signal((i-1)*sampling_per_bit + pulse_width + 1:i*sampling_per_bit) = -high_voltage;
        else
            % Encode a "0" bit as a negative pulse followed by a positive pulse
            output_signal((i-1)*sampling_per_bit + 1:(i-1)*sampling_per_bit + pulse_width) = -high_voltage;
            output_signal((i-1)*sampling_per_bit + pulse_width + 1:i*sampling_per_bit) = high_voltage;
        end
    end

    % Create a new figure
    figure();
    
    % Create the time axis
    t = linspace(0, length(output_signal)/sampling_per_bit, length(output_signal));
    
    % Plot the signal
    plot(t, output_signal);
    axis([0 t(end) -1.2*high_voltage 1.2*high_voltage]);
    
    % Add grid and labels
    grid on;
    xlabel('Time (s)');
    ylabel('Voltage (V)');
    title('Manchester Coding');


end