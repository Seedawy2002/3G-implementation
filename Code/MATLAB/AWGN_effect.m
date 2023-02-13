function [SNR1,SNR2,SNR3,SNR4,SNR5,SNR6]=AWGN_effect(mod_sig)

SNR1= awgn(mod_sig,-50,'measured'); % AWGN with SNR = -20
SNR2= awgn(mod_sig,-10,'measured'); % AWGN with SNR = 10
SNR3= awgn(mod_sig,-5,'measured'); % AWGN with SNR = 100
SNR4= awgn(mod_sig,0,'measured'); % AWGN with SNR = 100
SNR5= awgn(mod_sig,10,'measured'); % AWGN with SNR = 100
SNR6= awgn(mod_sig,50,'measured'); % AWGN with SNR = 100


end