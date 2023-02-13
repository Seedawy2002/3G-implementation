function x_DQPSK=QPSK_demodulation(x_QPSK_noisy,fc,Tb,nb)

x_DQPSK=[];
t_symbol = Tb/nb:Tb/nb:2*Tb;                
Ac_QPSK = sqrt(1/Tb);                    
ps1_QPSK = Ac_QPSK*cos(2*pi*fc*t_symbol);    
ps2_QPSK = Ac_QPSK*sin(2*pi*fc*t_symbol);   
x_DQPSK_p = [];
x_DQPSK_Q = [];


for i=2*nb:2*nb:length(x_QPSK_noisy)
  %Correlator 
  x_DQPSK_p_corr = ps1_QPSK.*x_QPSK_noisy((i-(2*nb-1)):i);    
  x_DQPSK_Q_corr = ps2_QPSK.*x_QPSK_noisy((i-(2*nb-1)):i);    
  x_DQPSK_p_int=trapz(t_symbol,x_DQPSK_p_corr);          
  x_DQPSK_Q_int=trapz(t_symbol,x_DQPSK_Q_corr);          
  x_DQPSK_p = [x_DQPSK_p x_DQPSK_p_int];
  x_DQPSK_Q = [x_DQPSK_Q x_DQPSK_Q_int];
  %Decision
  if(x_DQPSK_p_int>0)  
    symbol_p=1;       
  else          
    symbol_p=0;       
  end
  if(x_DQPSK_Q_int>0)  
    symbol_Q=1;       
  else          
    symbol_Q=0;       
  end
  x_DQPSK=[x_DQPSK symbol_p symbol_Q];
end


end