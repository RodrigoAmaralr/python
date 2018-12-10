function [PATp, PATf, PATd]=intervalECG_PPG(PeaksECG, PeaksPPG, ECG_RR)

%Interval PATp
LengthECG = length(PeaksECG);
LengthPPG = length(PeaksPPG);
if LengthECG > LengthPPG
    Cont = LengthECG;
else
    Cont = LengthPPG;
end

ECG = zeros(1, Cont);
PPG = zeros(1, Cont);

contECG = 1;
contPPG = 1;
for k = 1 : Cont
    if ((PeaksPPG(contPPG) - PeaksECG(contECG)) < mean(ECG_RR) / 2) && (PeaksPPG(contPPG) > PeaksECG(contECG))      
        ECG(k) = PeaksECG(contECG);
        PPG(k) = PeaksPPG(contPPG);
        contECG = contECG + 1; 
        contPPG = contPPG + 1;
    else
        if (PeaksPPG(contPPG) < PeaksECG(contECG))
            contPPG = contPPG + 1;
        else
            contECG = contECG + 1;
        end
    end
end
PATp = PPG - ECG;

%Interval PATf

PATf = 0;

%Interval PATd
PATd = 0; 
