% BIPOLAR_NRZ - Generates a bipolar non-return-to-zero (NRZ) waveform from a binary
% sequence.
%
% Syntax:
% y = bipolar_nrz(bits, high_voltage_level, samples_per_bit)
%
% Inputs:
% - bits: A row vector representing the input binary sequence.
% - high_voltage_level: A scalar representing the amplitude of the high 
%   voltage level for a logic high bit.
% - samples_per_bit: A scalar representing the number of samples per bit. 
%   If not specified, its default value is 100.
%
% Outputs:
% - y: A row vector representing the generated bipolar RZ waveform.
%
% Description:
% The bipolar_nrz function generates a bipolar non-return-to-zero (NRZ) waveform 
% from a binary sequence. The function accepts three input arguments: bits, 
% which is a row vector representing the input binary sequence; 
% high_voltage_level, which is a scalar representing the amplitude of the 
% high voltage level for a logic high bit; and samples_per_bit, which is a 
% scalar representing the number of samples per bit. If samples_per_bit is
% not specified, its default value is 100.
%
% The function first checks the input arguments and computes the number
% ofsamples in the waveform as the product of the length of the binary 
% sequence and the number of samples per bit. It then creates a vector of 
% zeros with length equal to the number of samples in the waveform.

% It sets two flags, pos_flag and neg_flag,
% to keep track of the polarity of the waveform.

% The function generates the RZ pulse waveform by iterating over the input 
% binary sequence. For each bit in the sequence, if the bit is a logic high 
% bit (i.e., equal to 1), the function sets the amplitude of the waveform 
% to the high_voltage_level for the first half of the bit time, and then 
% sets it to zero for the second half of the bit time. If the bit is a 
% logic low bit (i.e., equal to 0), the function sets the amplitude of the 
% waveform to zero for the entire bit time. The function ensures that the 
% waveform is alternating between positive and negative polarities for 
% consecutive logic high bits.

% The function then creates a new figure and plots the generated waveform 
% on the time axis using the plot function. It sets the axis labels, 
% title, and limits the y-axis to the range [-1.2*high_voltage_level, 
% 1.2*high_voltage_level].

% Finally, the function returns the generated waveform as a row vector.

% Overall, the bipolar_nrz function is a useful tool for generating bipolar 
% NRZ waveforms from binary sequences. It can be used in various 
% applications, such as in telecommunications, where bipolar RZ is a 
% commonly used encoding scheme for transmitting digital data over long 
% distances. The generated waveform can provide insights into the timing and 
% voltage levels of the transmitted bits and can be used for further analysis
% and processing.

function y = bipolar_nrz(bits, high_voltage_level, samples_per_bit)
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

pos_flag = 1;
neg_flag = 0;
% Generate the RZ pulse waveform
for i = 1:length(bits)
    if bits(i) == 1
        if neg_flag == 0 && pos_flag == 0
            pos_flag = 1;
        end 
        if i > 1 && neg_flag == 1 
            waveform((i-1)*samples_per_bit + 1:i*samples_per_bit) = - high_voltage_level;
            neg_flag = 0;
        end
        if pos_flag == 1
            % Set the amplitude to high voltage level for a logic high bit
            waveform((i-1)*samples_per_bit + 1:i*samples_per_bit + pulse_width) = high_voltage_level;
            pos_flag = 0;
            neg_flag = 1;
        end
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
axis([0 t(end) -1.2*high_voltage_level 1.2*high_voltage_level]);

% Add grid and labels
grid on;
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Bipolar RZ Signal');

% Return the generated waveform
y = waveform;
end