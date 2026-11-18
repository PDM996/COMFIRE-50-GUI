function [LAM_DENS,RWF,FW,LAM_SPHT,LAM_TCT,LHWVap,RW,RhoF,LAM_SPHT2,LAM_TCT2]=...
    Material_Properties(FIBRE_DENS,volFr,RESIN_DENS,FIBRE_SPHT,RESIN_SPHT,FIBRE_TCT,RESIN_TCT,varargin)
% load inputVariables

%**************************************************************************
%                         Material Properties
%**************************************************************************

%**************************************************************************
% - Assign fibre properties
%
% assignFibre(nFibre)
load Fibre
%**************************************************************************
% - Assign resin properties
%
% assignResin (nResin)
load Resin
%**************************************************************************
% Material Properties
%**************************************************************************
% - Calculation of laminate properties
% Initial density according to Micro-Mechanic
FW = FIBRE_DENS * volFr;        % Initial fibre mass per unit volume in laminate (kg/m^3)
RW = RESIN_DENS * (1 - volFr);  % Initial resin mass per unit volume in laminate (kg/m^3)
LAM_DENS = FW + RW;             % Initial laminate density (kg/m^3)
RWF = RW * RESIN_FNL;           % Final resin mass per unit volume in laminate (kg/m^3)
RhoF =FW + RWF;                 % Final laminate density (kg/m^3)

% Initial specific heat capacity
SPHT1 = volFr * FIBRE_SPHT * FIBRE_DENS + (1 - volFr) * RESIN_SPHT * RESIN_DENS;
SPHT2 = volFr * FIBRE_DENS + (1 - volFr) * RESIN_DENS;
LAM_SPHT = SPHT1 / SPHT2;

% Initial thermal conductivity
TCT1 = volFr / FIBRE_TCT + (1 - volFr) / RESIN_TCT;
LAM_TCT = 1 / TCT1;

% If there is decomposition then the properties are updated according to
% the RRC instead of the initial resin volume fraction=(1-volFr)
if ~isempty(varargin)
    RRC=varargin{1}; %varargin{1};
    
    % Specific heat capacity function of the Remaining Resin Content
    SPHT12 = volFr * FIBRE_SPHT * FIBRE_DENS + RRC * (1-volFr) * RESIN_SPHT * RESIN_DENS;
    SPHT22 = volFr * FIBRE_DENS + RRC * (1-volFr) * RESIN_DENS;
    LAM_SPHT2 = SPHT12 / SPHT22;
%     varargout{1}=LAM_SPHT2;

    % Thermal conductivity function of the Remaining Resin Content
    TCT12 = volFr / FIBRE_TCT + (RRC * (1-volFr) )/ RESIN_TCT;
    LAM_TCT2 = 1 / TCT12;
%     varargout{2}=LAM_TCT2;
    
else
end
%....."Mystery" constant
ALPHA_COMP_FNL = FIBRE_TCT / (FIBRE_DENS * volFr * FIBRE_SPHT);     % ***** ????? *****

% - Decomposition Constants
LHWVap=2.257*10^6;    % LATENT HEAT OF WATER VAPORIZATION (J/KG) it was "HFG"


save inputVariables
end
%**************************************************************************
%**************************************************************************