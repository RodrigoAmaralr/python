function location_peaks_PPG = find_PPG_peaks_locations(x, fs)

[PKS,LOCS]= findpeaks(x, 'MinPeakProminence',mean(x)/3);
location_peaks_PPG = LOCS.';

 
