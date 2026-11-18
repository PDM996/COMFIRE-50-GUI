function coldface(kCF)
% This function just showes the colf face boundary condition option chosen.
if kCF==0;
    K='Cold face thermally insulated.';
elseif kCF==1;
    K='Cold face boundary conditions: natural convection+free radiation.';
elseif kCF==2;
    K='Cold face boundary conditions:  attached to a steel plate.';
elseif kCF==3;
    K='Cold face boundary conditions: attached to copper heat sink.';
elseif kCF==4;
    K='Cold face boundary conditions: natural convection only (research purpouse).';
elseif kCF==5;
    K='Cold face boundary conditions: free radiation only (research purpouse).';
elseif kCF==6;
    K='Cold face boundary conditions: attached to a liquid heat sink.';
elseif kCF==7;
    K='Cold face boundary conditions: constant heat transfer coefficient.';
end
disp (K)
K=[K,' \n'];
fid=fopen('Simulation_Summary.txt','a+');
fprintf(fid, K);
status=fclose(fid);
end