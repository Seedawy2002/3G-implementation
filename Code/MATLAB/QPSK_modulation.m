function QPSK_sig=QPSK_modulation(Generated_bits,fc,Tb,nb)


T_baud = Tb/nb : Tb/nb : 2*Tb;  %Time of two symbol (1 Baud)
Ac=sqrt(1/Tb);
carrier1= Ac*cos(2*pi*fc*T_baud);  
carrier2= Ac*sin(2*pi*fc*T_baud);
Even_sequence=[];
Odd_sequence=[];

% Encoding the even sequence: 
for j=1: length(Generated_bits)/2
    if Generated_bits(2*j) == 1
        C_temp=carrier2;
      
    else
         C_temp=-carrier2;        
    end
    Even_sequence=[Even_sequence,C_temp ]; 
end

% Encoding the odd sequence: 
for j=0: (length(Generated_bits)/2)-1
    if Generated_bits(2*j+1) == 1
          C_temp=carrier1;  
    else  
         C_temp=-carrier1;       

    end
    Odd_sequence=[Odd_sequence,C_temp ];
    
end

QPSK_sig= Even_sequence+Odd_sequence;  %Adding Odd and Even Sequences to generate QPSK Signal


end