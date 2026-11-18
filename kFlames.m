function [QFLUX]=kFlames(Flames, HF, QFLUX)
% This function just shows the Hot Face boundary condition option chosen.
if HF==2
    if Flames==1
        disp(['Constant heat flux of ',num2str(QFLUX),' kW/m^2, flames feedback included.']);
        fid = fopen(strcat('Simulation_Summary.txt'),'a+');
        fprintf(fid,['Constant heat flux of ',num2str(QFLUX),' kW/m^2, flames feedback included \n']);
        status=fclose(fid);
    else
        disp(['Constant heat flux of ',num2str(QFLUX),' kW/m^2']);
        fid = fopen(strcat('Simulation_Summary.txt'),'a+');
        fprintf(fid,['Constant heat flux of ',num2str(QFLUX),' kW/m^2 \n']);
        status=fclose(fid);
    end
    QFLUX=QFLUX*1000; % Constant source Heat Flux [W m-2]
else
end
end