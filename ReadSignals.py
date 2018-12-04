# Read Signals ECG PPG ABP
import wfdb
import matplotlib.pyplot as plt
import numpy as np

def Read(PathSignal):
    signals, fields = wfdb.rdsamp(PathSignal, channel_names='PLETH' )
    print(fields)
    #signals, fields = wfdb.rdsamp(PathSignal, channels=[1])
    #print(fields)
    #for x in fields['sig_name']:
    #    if x == 'II':
    #        ECG = 'II'
    #    if x == 'PLETH':
    #        PPG = 'PLETH'
    #    if x == 'ABP':
    #        ABP = 'ABP'
    #print(np.shape(signals))	# Tamanho do sinal
    #plt.plot(signals[:,2])
    #plt.show()
	
	#https://www.w3schools.com/python/python_dictionaries.asp
    #for x in fields.items():
    #    print(x)
	
    ECG=1 
    PPG=2 
    ABP=3
    FS=4

    return ECG, PPG, ABP, FS
	


