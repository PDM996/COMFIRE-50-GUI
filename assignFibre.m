% *** assignResin Function ***
% Assign Resin constants based on input data
% Version 0.01
% Last updated: 30th November 2010
% Pietro Di Modica

function assignFibre(nFibre)

if nFibre == 1          % Glass fibres
    FIBRE_DENS = 2560;  % Fibre density [kg/m^3]2560   
    FIBRE_SPHT = 760; % Fibre specific heat capacity [J/kg.K]760.0
    FIBRE_TCT = 1.09;   % Bulk fibre thermal conductivity [W/m.K]1.09
    disp 'Glass fibres has been chosen'
    FIBRES='Glass fibres';
    
elseif nFibre == 2      % Carbon fibres
    FIBRE_DENS = 1750.0;% Fibre density [kg/m^3]   
    FIBRE_SPHT = 660.0; % Fibre specific heat capacity [J/kg.K]
    FIBRE_TCT = 0.32;   % Bulk fibre thermal conductivity [W/m.K]
    disp 'Carbon fibres has been chosen'
    FIBRES='Carbon fibres';
    
elseif nFibre == 3     % Aramid fibres
    FIBRE_DENS = 1450.0;% Fibre density [kg/m^3]   
    FIBRE_SPHT = 1420.0;% Fibre specific heat capacity [J/kg.K]
    FIBRE_TCT = 0.16;   % Bulk fibre thermal conductivity [W/m.K]
    disp 'Aramid fibres has been chosen'
    FIBRES='Aramid fibres';
    
elseif nFibre == 4     % Aluminium layers
    FIBRE_DENS = 2700.0;% Fibre density [kg/m^3]   
    FIBRE_SPHT = 897.0; % Fibre specific heat capacity [J/kg.K]
    FIBRE_TCT = 222.0;   % Bulk fibre thermal conductivity [W/m.K]
    disp 'Aluminium layers has been chosen'
    FIBRES='Aluminium layers';
else
    disp 'Fibre item limit exceeded: nFibre>4. Insert the values required in the popup box.'
    prompt = {'Fibre density [kg/m^3]:','Fibre specific heat capacity [J/[kg.K]]:',...
        'Bulk fibre thermal conductivity [W/[m.K]]:'};
    dlg_title = 'Input for Fibre Thermal/ Properties';
    num_lines = 0.75;
    def = {'2560','760','1.09'};
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    
    FIBRE_DENS = str2double(answer{1}); % Fibre density [kg/m^3]   
    FIBRE_SPHT = str2double(answer{2}); % Fibre specific heat capacity [J/kg.K]
    FIBRE_TCT =  str2double(answer{3}); % Bulk fibre thermal conductivity [W/m.K]
    FIBRES='CUSTOM type';
        
%     options.Resize='on';
%     options.WindowStyle='normal';
%     options.Interpreter='tex';
%     answer=inputdlg[prompt,dlg_title,numlines,defaultanswer,options];
    %     return
end
save Fibre

fid = fopen('Simulation_Summary.txt','a+');
FIBRES=['Reinforcement type: ',FIBRES,'\n'];
fprintf(fid, FIBRES);
status=fclose(fid);

return
end
