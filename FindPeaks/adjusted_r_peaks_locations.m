function r_location = adjusted_r_peaks_locations(x, fs, search_window_length_ms)

[~ ,r_non_adjusted_locations] = pan_tompkin(x,fs,0);
 
L = search_window_length_ms / 1000 * fs;

r_location = zeros(size(r_non_adjusted_locations));

for k = 1 : length(r_location)
    i1 = max([1 r_non_adjusted_locations(k) - round(L / 2)]);
    i2 = min([r_non_adjusted_locations(k) + round(L / 2) length(x)]);
    xs = x(i1 : i2);
    i = find(xs == max(xs));
    
    if length(i) > 1
        i = i(1);
    end
   r_location(k) = (i1 + i - 1);
end