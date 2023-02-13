function  [rayleigh_Effect,rician_Effect]=Channel_Effects(input_sig)


 ricianChan= comm.RicianChannel; % Create Rician Fading Channel
 rician_Effect=ricianChan(input_sig);

% Rayleigh Channel effect:

 rayleighchan = comm.RayleighChannel; % Create Rayleigh Fading Channel
 rayleigh_Effect = rayleighchan(input_sig);

 % Rician Channel effect:



end