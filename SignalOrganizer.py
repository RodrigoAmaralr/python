# Program for organizer signals
# 1 ABP
# 2 PPG
# 3 ECG
# 4 ECG





import wfdb
import matplotlib.pyplot as plt
import numpy as np

def Read(PathSignal):
    signals, fields = wfdb.rdsamp(PathSignal)
    #print(np.shape(signals))
    #plt.plot(signals[:,2])
    #plt.show()
	
	#https://www.w3schools.com/python/python_dictionaries.asp
    for x in fields.items():
        print(x)
    ECG = 1
    PPG = 2
    ABP = 3
    return ECG, PPG, ABP
	
    