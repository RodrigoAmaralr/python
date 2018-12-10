function [r_location, RR, QS] = ECG_features(x, fs)

search_window_length_ms = 20;
%Localiza R
r_location = adjusted_r_peaks_locations(x, fs, search_window_length_ms);

%Localiza RR
RR = zeros(1, length(r_location));

for k = 1 : length(RR)
    x1 = min([k + 1 length(r_location)]);
    RR(1,k) = r_location(1,x1) - r_location(1,k);
end

% Localiza S
s_location = adjusted_s_peaks_locations(x, fs, search_window_length_ms);

% Localiza Q
q_location = q_peaks_locations(x, r_location, s_location);

QS = zeros(1, length(r_location));
for k = 1 : length(QS)
    QS(1,k) = s_location(1,k) - q_location(1,k);
end
