% Filter functionality
function [data_filtered, s] = filter_signal(desired_rate, time_sampling)
    % Initialize DAQ
    s = daq('ni');
    ch = addinput(s, 'Dev1', 'ai0', 'Voltage');

    % Set sampling rate and number of scans
    s.Rate = desired_rate;
    s.NumberOfScans = time_sampling * desired_rate;

    % Acquire data
    data = s.startForeground();

    % Butterworth filter parameters
    Wp = 50 / (desired_rate / 2);
    Ws = 100 / (desired_rate / 2);
    Ap = 3;
    As = 30;
    [n, Wn] = buttord(Wp, Ws, Ap, As);
    [b, a] = butter(n, Wn, 'low');

    % Apply Butterworth filter
    y = filtfilt(b, a, data);

    % 60Hz notch filter parameters
    wo = 60 / (desired_rate / 2);
    bw = 10 / (desired_rate / 2);
    [d, c] = iirnotch(wo, bw);

    % Apply notch filter
    data_filtered = filtfilt(d, c, y);
end