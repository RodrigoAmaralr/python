import ReadSignals
import wfdb


def PAT_Features(PathSignal):
    signals, fields = wfdb.rdsamp(PathSignal, channel_names='PLETH' )
    print()

def main():
    PAT_Features('3000063_0010')
    #ECG, PPG, ABP, FS = ReadSignals.Read('3000063_0010')
    #print(ECG)
    #print(PPG)
    #print(ABP)
    #print(FS)
	#signals, fields = wfdb.rdsamp('3000063_0010')
	#wfdb.plot_all_records(directory='matlab')
	

if __name__ == "__main__":
    main()