import wfdb
import matplotlib.pyplot as plt
import numpy as np

import ReadSignals

#from __future__ import division
from sympy import *

#https://professor.ufrgs.br/pedro/files/3-derivada.html
def Derivada():
    init_printing()
    x, y = symbols('x y') #define x e y como variáveis simbólicas.
    print(x)
    print(y)
    print(diff(f(x),x).subs(x,10))
    
def f(x): 
    return (x**3 - 3*x + 2)*exp(-x/4) - 1


def PAT_Features(PathSignal):
    N = 0
    signals, fields = wfdb.rdsamp(PathSignal)
    #print(np.shape(signals))	                    # Tamanho do sinal
    #print(fields)
    fs = fields['fs']
    sig_len = fields['sig_len']
    seconds = sig_len/fs
    t = np.arange(0., seconds, seconds/sig_len)
    names = fields['sig_name']                      # Pega o nome das variáveis
    #print(names)
    
    #Procura por um nome especifico
    for i, name in enumerate(names):
        if name == 'PLETH':
            N = i
    #Salva os dados
    signal = signals[:,N]
    fs = fields['fs']
    
    Derivada()
    
   
    plt.title(names[N])                             # Define o nome do titulo
    plt.xlabel('segundos')
    plt.ylabel('mv')
    plt.plot(t, signal)
    plt.show()

    
    
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