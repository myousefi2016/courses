function x=initial_coord(sigma_Ar,N,a_0)

%We're going to build an FCC structure using the lattice parameter 
% http://www.infoplease.com/periodictable.php?id=18
% which has a_0=5.260


cube = (N)^(1/3);

for i = 1:cube
    
    for j = 1:cube
        
        x(