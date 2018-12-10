function s_location = adjusted_s_peaks_locations(x, fs, search_window_length_ms)

s_location = adjusted_r_peaks_locations(-x, fs, search_window_length_ms);
