function kCpDependency(kCp)
% This function just showes the cold face boundary condition option chosen.
if kCp==1
    K='Cp and k temperature dependency is taken into account in the calculation using a table of values.';
elseif kCp==2
    K='Cp and k temperature dependency is taken into account in the calculation using a polynomial fit.';
elseif kCp==3
    K='Cp and k are changing according the the rule of mixture using the RRC and gas properties';
elseif kCp==4
    K='Cp and k are changing according the the rule of mixture applied to a homogeneous material made of virgin and char  thermal properties VS temperature';
else
    K='Cp and k are treated as single point values during the calculation.';
end
disp(K);
K=[K,' \n'];
fid=fopen('Simulation_Summary.txt','a+');
fprintf(fid, K);
status=fclose(fid);
end