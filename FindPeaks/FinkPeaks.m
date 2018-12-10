clear all; close all; clc;

%wfdb2mat('3000063_0010');
% [tm,signal,Fs,labels]=rdmat('3000063_0010m');
% x = signal(:,1)*10;
% plot(x);
% r_location = adjusted_r_peaks_locations(x, Fs, 0);
% [qrs_amp_raw,qrs_i_raw,delay] = pan_tompkin(x,Fs,0);
% 
% plot(tm, signal(:,1));
load('3000063_0010m.mat');
ECG = val(1,:).';
ABP = val(2,:).';
PPG = val(3,:).';
fs = 125;


% Caracteristicas do ECG
[r_location, RR, QS] = ECG_features(ECG, fs);
% plot(ECG); hold on; plot(r_location, ECG(r_location), 'xr');

% Localiza picos do PPG
location_peaks_PPG = find_PPG_peaks_locations(PPG, fs);
% figure; plot(PPG); hold on; plot(location_peaks_PPG, PPG(location_peaks_PPG), 'xr');

% Find features ECG and PPG
[PATp, PATf, PATd] = intervalECG_PPG(r_location, location_peaks_PPG, RR);
plot(PATp); figure;

% figure; plot(ABP);

plot(ECG, 'r'); hold on; plot(PPG, 'b'); hold on; plot(ABP, 'g');