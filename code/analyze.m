% Analyze functionality
% This script runs the filter and plot functions

desired_rate = 360; % Desired sampling rate in Hz
time_sampling = 5;  % Sampling duration in seconds

% Call the filter function to acquire and filter the signal
[data_filtered, s] = filter_signal(desired_rate, time_sampling);

% Call the plot function to analyze and visualize the signal
plot_signal(data_filtered, s);