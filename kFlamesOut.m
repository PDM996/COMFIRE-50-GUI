function [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT,COMB_EFF)
% This function updates the heat flux on the Hot Face due to combustion of decomposition gases.
if HF==2&&Flames==1
    QFLUXNEW=QFLUX+(K_GM*GasFlowT*COMB_EFF);
else
end
end