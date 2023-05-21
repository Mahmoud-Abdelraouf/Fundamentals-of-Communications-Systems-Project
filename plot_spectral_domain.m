% PLOT_SPECTRAL_DOMAIN Plots the power spectral density (PSD) of a waveform in the
% frequency domain.
%
%   plot_spectral_domain(waveform)
%
%   Arguments:
%   - waveform: A row vector representing the input waveform.
%
%   The function first computes the Fourier transform of the input waveform using
%   the `fft` function. It then computes the power spectral density (PSD) of the
%   transformed waveform by taking the absolute value squared of the Fourier
%   transform and dividing it by the length of the waveform. The negative values
%   of the PSD are set to zero and the square root of the PSD is taken to obtain
%   the root-mean-square (RMS) PSD. The function then plots the RMS PSD of the
%   waveform on a linear scale in the frequency domain. The x-axis represents the
%   normalized frequency, and the y-axis represents the power/frequency in volts
%   per hertz. The function sets the axis labels and title, and limits the x-axis
%   to the maximum frequency and the y-axis to positive values only.
%
%   Example usage:
%   >> t = linspace(0, 1, 1000);
%   >> f = 10;
%   >> waveform = sin(2*pi*f*t);
%   >> plot_spectral_domain(waveform);
%
function plot_spectral_domain(waveform)
    % Apply a Hamming window to the input waveform
    N = length(waveform);
    window = hamming(N)';
    waveform = waveform .* window;

    % Compute the Fourier transform of the input waveform
    spectrum = fftshift(fft(waveform));

    % Compute the power spectral density (PSD)
    psd = abs(spectrum).^2 / (N);

    % Set negative values of the PSD to zero and take the square root
    psd(psd < 0) = 0;
    rms_psd = sqrt(psd)/10;

    % Check for impulses in the PSD
    threshold = 60 * mean(rms_psd); % set threshold as 10 times the mean RMS PSD
    if any(rms_psd > threshold)
        % If there are impulses, exclude them from the max value calculation
        max_psd = max(rms_psd(rms_psd <= threshold)) * 1.5;
        disp('Impulse detected in the PSD');
    else
        % If there are no impulses, use the max value of the RMS PSD
        max_psd = max(rms_psd) * 1.5;
    end

    % Define the frequency axis for the plot in normalized frequency
    f_norm = linspace(-1/2, 1/2, N);


    % Create a new figure
    figure();

    % Plot the RMS PSD on a linear scale
    plot(f_norm, rms_psd);


    % Set the axis labelsand title
    xlabel('Normalized Frequency');
    ylabel('Power/Frequency (V/Hz)');
    title('Power Spectral Density');

    % Set the x-axis limit based on the input waveform
    f_max = 1/2;
    f_step = 1/N;
    x_lim = [-(f_max-f_step)/6, (f_max-f_step)/6];
    xlim(x_lim);

    % Set the y-axis limit based on the input waveform
    y_lim = [0, max_psd*1.1];
    ylim(y_lim);
end