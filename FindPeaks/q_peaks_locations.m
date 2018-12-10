function q_location = q_peaks_locations(x, r_location, s_location)

Distancia_R_S = s_location - r_location;
Distancia_Q_R = r_location - Distancia_R_S;

q_location = zeros(size(r_location));
for k = 1 : length(Distancia_Q_R)
    i1 = max([1 Distancia_Q_R(k)]);
    i2 = min([r_location(k) length(x)]);
    xs = x(i1 : i2);
    i = find(xs == min(xs));
    if length(i) > 1
        i = i(1);
    end
    q_location(k) = (i1 + i - 1);
end
