% *** assignResin Function ***
% Assign Resin constants based on input data
% Version 0.01
% Last updated: 30th November 2010
% Pietro Di Modica

function assignResin(nResin)

if nResin == 1          % Polyester resin
    RESIN_DENS = 1200;  % Resin density [kg/m^3]
    RESIN_SPHT = 1600;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT = 0.19;   % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL = 0.02;   % Reidue after complete burning [%]
    AA = 1.154E8;       % Pre-exponential factor in Arrhenius equation [1/s]
    EE = 134131;        % Activation energy in Stage 1 reaction [J/mol]
    H = -2344600;       % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT = 2386.5;  % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'Polyester resin has been chosen'
    RESINS='Polyester resin.';
    
elseif nResin == 2      % Vinylester resin
    RESIN_DENS = 1120;  % Resin density [kg/m^3]
    RESIN_SPHT = 1800;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT = 0.19;   % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL = 0.05;   % Reidue after complete burning [%]
    AA = 3.16E12;       % Pre-exponential factor in Arrhenius equation [1/s]
    EE = 2.0E5;         % Activation energy in Stage 1 reaction [J/mol]
    H = -2344600;       % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT = 2386.5;  % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'Vinylester resin has been chosen'
    RESINS='Vinylester resin.';
    
elseif nResin == 3      % Epoxy resin
    RESIN_DENS = 1300;  % Resin density [kg/m^3] 1300
    RESIN_SPHT = 1850;  % Resin specific heat capacity [J/[kg.K]] 1850
    RESIN_TCT = 0.35;   % Resin thermal conductivity [W/[m.K]] 0.35
    RESIN_FNL = 0.02;   % Reidue after complete burning [%] 0.02
    AA = 500;           % Pre-exponential factor in Arrhenius equation [1/s] 500
    EE = 60500;         % Activation energy in Stage 1 reaction [J/mol] 60500
    H = -2344600;       % Resin heat of decomposition in Stage 1 reaction [J/kg] -2344600
    GAS_SPHT = 2386.5;  % Gas specific heat capacity [J/[kg.K] 2386.5
    K_GM=22.114214E6;    % Heat of combustion [J/kg] 22.114214E6 
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'Epoxy resin has been chosen'
    RESINS='Epoxy resin.';
    
elseif nResin == 4      % Phenolic resin
    RESIN_DENS = 1360;  % Resin density [kg/m^3]
    RESIN_SPHT = 1600;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT = 0.28;   % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL = 0.55;   % Reidue after complete burning [%]
    AA = 5;             % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
    EE = 27200;         % Activation energy in Stage 1 reaction [J/mol]
    H = -2344600;       % Resin heat of decomposition in Stage 1 reaction [J/kg]
    AA2 = 680;          % Pre-exponential factor in Stage 2 in Arrhenius equation [1/s]
    EE2 = 65200;        % Activation energy in Stage 2 reaction [J/mol]
    H2 = H;             % Resin heat of decomposition in Stage 2 reaction [J/kg]
    GAS_SPHT = 9630;    % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    RC12 = 0.73;        % Remaining resin content value between Phase 1 and 2
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'Phenolic resin has been chosen'
    RESINS='Phenolic resin.';
    
elseif nResin == 5      % HDPE
	RESIN_DENS=860;     % Resin density [kg/m^3]
    RESIN_SPHT=3500.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.29;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.02;     % Reidue after complete burning [%]
    AA=4.8E22;          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE=3.49E5;          % Activation energy in Stage 1 reaction [J/mol]
	H=-920000;          % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT=2386.5;    % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'HDPE resin has been chosen'
    RESINS='HDPE resin.';
    
elseif nResin == 6      % HIPS
	RESIN_DENS=950;     % Resin density [kg/m^3]
    RESIN_SPHT=2000.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.22;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.01;      % Reidue after complete burning [%]
    AA=1.2E16;          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE=2.47E5;          % Activation energy in Stage 1 reaction [J/mol]
	H=-1000000;         % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT=2386.5;    % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'HIPS resin has been chosen'
    RESINS='HIPS resin.';
    
elseif nResin == 7      % PMMA
	RESIN_DENS=1100;    % Resin density [kg/m^3]
    RESIN_SPHT=2200.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.20;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.01;      % Reidue after complete burning [%]
	AA=8.5E12;          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE=1.88E5;          % Activation energy in Stage 1 reaction [J/mol]
	H=-870000;          % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT=2386.5;    % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'PMMA resin has been chosen'
    RESINS='PMMA resin.';
    
elseif nResin == 8      % Polycarbonate
	RESIN_DENS=1180;    % Resin density [kg/m^3]
    RESIN_SPHT=1900.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.22;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.55;     % Reidue after complete burning [%]
    AA=1.9E18;          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE=2.95E5;          % Activation energy in Stage 1 reaction [J/mol]
	H=-830000;          % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT=2386.5;     % Gas specific heat capacity [J/[kg.K]
	K_GM=25.6E6;         % Heat of combustion
    COMB_EFF=1;         % Combustion efficiency
	CHAR_DENS=248.0;    % Char density [kg/m^3]
	CHAR_SPHT=1720;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=0.37;      % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=0.85;     % Char emissivity
    disp 'Polycarbonate resin has been chosen'
    RESINS='Polycarbonate resin.';
    
elseif nResin == 9      % PVC
	RESIN_DENS=1430;    % Resin density [kg/m^3]
    RESIN_SPHT=1550.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.17;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.55;     % Reidue after complete burning [%]
    AA=1.4E33;          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE=3.67E5;          % Activation energy in Stage 1 reaction [J/mol]
	H=-170000;          % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT=2386.5;    % Gas specific heat capacity [J/[kg.K]
	K_GM=23.0E6;         % Heat of combustion
    COMB_EFF=1;         % Combustion efficiency
	CHAR_DENS=629.0;    % Char density [kg/m^3]
	CHAR_SPHT=1600;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=0.2;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=0.87;     % Char emissivity
    disp 'PVC resin has been chosen'
    RESINS='PVC resin.';
    
elseif nResin == 10      % Sandra
	RESIN_DENS=1180;    % Resin density [kg/m^3]
    RESIN_SPHT=1800.0;  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT=0.35;     % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL=0.2;     % Reidue after complete burning [%]
    AA = 1.154E8;       % Pre-exponential factor in Arrhenius equation [1/s]
    EE = 134131;        % Activation energy in Stage 1 reaction [J/mol]
    H = -2344600;       % Resin heat of decomposition in Stage 1 reaction [J/kg]
    GAS_SPHT = 2386.5;  % Gas specific heat capacity [J/[kg.K]
    K_GM=22.114214E6;    % Heat of combustion [J/kg]
    COMB_EFF=1;         % Combustion efficiency
    CHAR_DENS=nan;    % Char density [kg/m^3]
	CHAR_SPHT=nan;     % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT=nan;       % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS=nan;     % Char emissivity
    disp 'Sandra resin has been chosen'
    RESINS='Sandra resin.';
    
else    
    disp 'Resin item limit exceeded: nResin>9. Insert the values required in the popup box.'
    prompt = {'Resin density [kg/m^3]:','Resin specific heat capacity [J/[kg.K]]:',...
        'Resin thermal conductivity [W/[m.K]]:','Reidue after complete burning [%]:',...
        'Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]:','Activation energy in Stage 1 reaction [J/mol]:',...
        'Resin heat of decomposition in Stage 1 reaction [J/kg]:','Pre-exponential factor  in Stage 2 in Arrhenius equation [1/s]:',...
        'Activation energy in Stage 2 reaction [J/mol]:','Resin heat of decomposition in Stage 1 reaction [J/kg]:',...
        'Gas specific heat capacity [J/[kg.K]:','Char density [kg/m^3]:','Char specific heat capacity [J/[kg.K]]:',...
        'Char thermal conductivity [W/[m.K]]:','Char emissivity:','Heat of combustion [J/kg]:','Combustion efficiency[-]:'};
    dlg_title = 'Input for Resin Thermal/Decomposistion Properties';
    num_lines = 0.75;
    def = {'1000','1500','0.2','0.02','1.44E33','3.5E5','170000','1.44E33','3.5E5','170000','2386.5','600','1600','0.2','0.9','23E6','1'};
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    
    RESIN_DENS= str2double(answer{1});  % Resin density [kg/m^3]
    RESIN_SPHT= str2double(answer{2});  % Resin specific heat capacity [J/[kg.K]]
    RESIN_TCT= str2double(answer{3});   % Resin thermal conductivity [W/[m.K]]
    RESIN_FNL= str2double(answer{4});   % Reidue after complete burning [%]
    AA= str2double(answer{5});          % Pre-exponential factor  in Stage 1 in Arrhenius equation [1/s]
	EE= str2double(answer{6});          % Activation energy in Stage 1 reaction [J/mol]
	H= str2double(answer{7});           % Resin heat of decomposition in Stage 1 reaction [J/kg]
    AA2= str2double(answer{8});          % Pre-exponential factor  in Stage 2 in Arrhenius equation [1/s]
	EE2= str2double(answer{9});          % Activation energy in Stage 2 reaction [J/mol]
	H2= str2double(answer{10});          % Resin heat of decomposition in Stage 2 reaction [J/kg]
    GAS_SPHT= str2double(answer{11});   % Gas specific heat capacity [J/[kg.K]
	K_GM= str2double(answer{16});       % Heat of combustion
    COMB_EFF= str2double(answer{17});   % Combustion efficiency
	CHAR_DENS= str2double(answer{12});  % Char density [kg/m^3]
	CHAR_SPHT= str2double(answer{13});  % Char specific heat capacity [J/[kg.K]]
	CHAR_TCT= str2double(answer{14});   % Char thermal conductivity [W/[m.K]]
	CHAR_EMIS= str2double(answer{15});  % Char emissivity
    RESINS='CUSTOM resin.';
   
%     options.Resize='on';
%     options.WindowStyle='normal';
%     options.Interpreter='tex';
%     answer=inputdlg[prompt,dlg_title,numlines,defaultanswer,options];
    %     return
end
save Resin

fid=fopen('Simulation_Summary.txt','a+');
RESINS=['Resins type: ',RESINS,'\n'];
fprintf(fid, RESINS);
status=fclose(fid);
return
end
