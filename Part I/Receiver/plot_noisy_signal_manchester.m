function plot_noisy_signal_manchester(signal,samples_per_bit)
    % Create a time vector for the signal
    t = linspace(0, length(signal)/samples_per_bit, length(signal));
    figure
    % Plot the Unipolar NRZ signal with time
    plot(t, signal);
    ylim([-3, 3]);
    xlabel('Time (s)');
    ylabel('Amplitude (V)');
    title('Manchester Signal');
end
