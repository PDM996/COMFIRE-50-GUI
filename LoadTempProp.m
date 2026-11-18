function [CpT,CpY,kT,kY]=LoadTempProp
% This function imports the two files of the themale propeties ov the laminate.
% If the thermal property files are missing or mispelled a popup window 
% will ask to chose the input file.

% The input temperature has to be input as a row vector and T must be in
% Degrees Celcius.

% The output file is two row vectors representing the thermal properties 
% (k and Cp)of each node according to their actual temperature.

[CpData,CpText,CpAll]=ImportFile('CP_temp.xls');
S1=size(CpData);
CpT=CpData(2:S1(1),1);
CpY=CpData(2:S1(1),2);

[kData,kText,kAll]=ImportFile('k_temp.xls');
S2=size(kData);
kT=kData(2:S2(1),1);
kY=kData(2:S2(1),2);
end
