function [gr]=radial_dis(N,L,x)

NUM=500;
gr(1:NUM,1)=0;
	rho = N/(L(1,1)*L(1,2)*L(1,3));
rij(1,1:3)=0;
delr = L(1,1)/NUM;
gr(:,2) = (1:NUM)*delr; 
for i=1:N
    for j=1:N
        if i~=j
            for k=1:3
            rij(1,k) = x(i,k) - x(j,k);
            rij(1,k) = periodic(rij(1,k),L(1,k));   %periodic boundaries
            end
            r2 = rij(1,1)^2 + rij(1,2)^2 + rij(1,3)^2;
            r=sqrt(r2);
            if r>0.01
            bin = floor(r/delr);
            gr(bin,1)=gr(bin,1)+1;
            end
        end
    end
end

for i=1:NUM
gr(i,1) = gr(i,1)/N;
gr(i,1) = gr(i,1)*(1/(rho*4*pi*(delr*delr*delr*(i*i + i + 0.25))));
end


% 	// calculates the radial distribution function
% 	int i, j, k;
% 	double gr[500];
% 	double rij[3];
% 	double r2, r;
% 	char grfilename[255];
% 	double delr;
% 	int bin;
% 	delr = L[0]/500;
% 	double rho;
% 	
% 	for (i=0; i<500; i++) gr[i] = 0.;
% 	
% 	rho = N/(L[0]*L[1]*L[2]);
% 	
% 	// calculate g(r) for every atom to get a good average
% 	for (i=0; i<N; i++){
% 		for (j=0; j<N; j++) {
% 			if (i!=j){
% 				for (k=0; k<3; k++) {
% 					rij[k] = x[i][k] - x[j][k];
% 					if (rij[k] > (L[k]/2)) rij[k] = rij[k] - L[k];    // nearest image
% 					if (rij[k] < (-L[k]/2)) rij[k] = rij[k] + L[k];
% 				}
% 				r2 = rij[0]*rij[0] + rij[1]*rij[1] + rij[2]*rij[2];
% 				r = sqrt(r2);
% 				bin = floor(r/delr);
% 				gr[bin] = gr[bin]+1.;
% 			}
% 		}
% 	}
% 
% 	sprintf(grfilename, "gr%d.txt", t);
% 	gr_out.open(grfilename);
% 	
% 	for (i=0; i<500; i++) {
% 		gr[i] = gr[i]/N;
% 		gr[i] = gr[i]*(1/(rho*4*pi*(delr*delr*delr*(i*i + i + 0.25))));
% 		gr_out << gr[i] << endl;
% 	}
% 
% 	gr_out.close ();
% }	

