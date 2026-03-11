% Plot functionality
function plot_signal(data_filtered, s)
    % Find heart rate using FFT
    heart_rate = fft(data_filtered);
    f = s.Rate / s.NumberOfScans * (0:(s.NumberOfScans / 2));
    P2 = abs(heart_rate / s.NumberOfScans);
    P1 = P2(1:s.NumberOfScans / 2 + 1);
    P1(2:end-1) = 2 * P1(2:end-1);

    % Plot heart rate amplitude
    figure;
    plot(f, P1, "LineWidth", 3);
    title("Amplitude of Heart Rate");
    xlabel("f (Hz)");
    ylabel("|P1(f)|");

    % Plot raw and filtered data
    figure;
    plot(data_filtered, '.--b');
    title("Filtered Signal");
    xlabel("Sample");
    ylabel("Amplitude");
end