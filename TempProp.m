function [CpOut,kOut]=TempProp(T,CpT,CpY,kT,kY,varargin)
% This function calculates the thermal conductivity and specific heat of
% each node according to their temperature using a linear interpolation in 
% between the data points given in the input files loaded before.

% The input temperature has to be input as a row vector and T must be in
% Degrees Celcius.

% The output file is two row vectors representing the thermal properties 
% (k and Cp)of each node according to their actual temperature.

a=size(T);

if a(1)>1
    error('myApp:argChk','Input temperature of wrong size. the input variable has to be a row vector')
else
end

CpOut=lin_interp(CpT,CpY,T);
kOut=lin_interp(kT,kY,T);

if ~isempty(varargin)
figure(gcf+1);plot(CpT,CpY,'o',(CpT(1):CpT(length(CpT))),lin_interp(CpT,CpY,(CpT(1):CpT(length(CpT)))));title('Cp Vs Temperature');xlabel('Temperature [°C]');ylabel('Cp');legend('Table','Interpolated');
figure(gcf+1);plot(kT,kY,'o',(kT(1):kT(length(kT))),lin_interp(kT,kY,(kT(1):kT(length(kT)))));title('k Vs Temperature');xlabel('Temperature [°C]');ylabel('k');legend('Table','Interpolated');
else
end
end