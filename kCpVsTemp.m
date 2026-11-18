%% K nad Cp versus temperature for Geoff's CFRP
% This function calculate the Specific heat and the thermal conductivity of
% the material in virgin state and charred state at the wanted temperature 
% It returns 1 matrix where the odd columns are Cp and k of the virgin
% material respectively and the even clumns are the Cp and k of the charred
% material.

% Temperature has to be input in degree centigrade and the properties have
% the units of : k [[W m^-1 K^-1] and Cp [J kg^-1 K^-1]

function [kCp]= kCpVsTemp(T)
if T(:)<=250
    kCp(:,1)=  polyval ([7.461E-3,2.0919,810.76],T);%CpVirgin
    kCp (:,3)= polyval([-5E-8,5E-6,-1E-3,8.217E-1],T(:)); %kVirgin 
else
    kCp(:,1)=  polyval ([7.461E-3,2.0919,810.76],250);%1800; %CpVirgin
    kCp (:,3)= polyval([-5E-8,5E-6,-1E-3,8.217E-1],250);%0.103; %kVirgin
end

if T(:)<=550
    kCp(:,2)= polyval([1.645,897],T); %CpChar
else
    kCp(:,2)= polyval([1.645,897],550); %1800; %CpChar
end
    kCp (:,4)=0.15; %kChar
end

