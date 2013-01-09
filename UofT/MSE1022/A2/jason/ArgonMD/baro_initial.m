function [L,V,eps_p,eta_t]=baro_initial(N,barostat,L,eps_p,t_step,V,eta_t,tau_t,T,Tset,P,Pset,thermostat)

		if thermostat == 1 %1=true 
            eta_t = eta_t + t_step*(1./(tau_t*tau_t))*((T/Tset)-1.);
        else
            eta_t = 0.;
        end
		if barostat == 1 %1=true
            eps_p = eps_p + t_step*(1./(tau_p*tau_p))*(P-Pset);
        else
            eps_p = 0.;
        end


% C Code
% 			// find new cell size (if barostat is on)
% 			if (barostat == true) {
% 				for (k=0; k<3; k++) L[k] =
% 				L[k]*pow(1.+(3.*eps_p*t_step),(1./3.)); %pow raise base to
% 				the power exponent: double pow (      double base,
% 				double exponent );
% 				
% 				V = L[0]*L[1]*L[2];
% 			}

% C Code
% 			// calculate new barostat and thermostat parameters
% 			if (thermostat == true) eta_t = eta_t + (t_step/(tau_t*tau_t))*((T/Tset)-1.);
% 			else eta_t = 0.;	
% 				
% 			if (barostat == true) eps_p = eps_p + (t_step/(tau_p*tau_p))*(P-Pset);
% 			else eps_p = 0.;


