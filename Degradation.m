function [kDegra,kMasFl]=Degradation(kDegra,kMasFl)
if kDegra==1;
    disp 'Degradation effects are included in the model'
    fid = fopen(strcat('Simulation_Summary.txt'),'a+');
    fprintf(fid,'Degradation effects are included in the model \n');
    status=fclose(fid);
    
    if kMasFl==1;
        disp 'Heat transfer due to gaseous mass flow is included in the calculation'
        fid = fopen(strcat('Simulation_Summary.txt'),'a+');
        fprintf(fid,'Heat transfer due to gaseous mass flow is included in the calculation \n');
        status=fclose(fid);
    
    elseif kMasFl==0;
        disp 'Heat transfer due to gaseous mass flow ignored'
        fid = fopen(strcat('Simulation_Summary.txt'),'a+');
        fprintf(fid,'Heat transfer due to gaseous mass flow ignored');
        status=fclose(fid);
    
    else
        disp 'No valid option for heat transfer due to gaseous mass flow: 0 notinclude, 1 included.'
        prompt = {'Mass flow option: or 0 or 1.'};
        dlg_title = 'Mass flow option';
        num_lines = 1;
        def = {'0'};
        answer = inputdlg(prompt,dlg_title,num_lines,def);
        kMasFl = answer(1);
    end
    
elseif kDegra==0
    disp 'Degradation effects are not included in the model'
    fid = fopen(strcat('Simulation_Summary.txt'),'a+');
    fprintf(fid,'Degradation effects are not included in the model \n');
    status=fclose(fid);
    
else
    disp 'No valid option for degradation effecs: 0 notinclude, 1 included.'
    prompt = {'Degardatin effects: or 0 or 1.'};
    dlg_title = 'Degradation option';
    num_lines = 1;
    def = {'0'};
    answer = inputdlg(prompt,dlg_title,num_lines,def);
    kDegra = answer(1);
end
end