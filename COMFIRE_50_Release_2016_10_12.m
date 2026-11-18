% clear;close all; % To be converted into comments to run as function in the GUI

function COMFIRE_50_Release_2015_11_05(Jobname,hCF,nFibre,nResin,kCp,volFr,Thickness,Duration,FoUser,Tamb,...
    HF,Flames,QFLUX,emisHtSo,absorpLam,emisLam,kSur,kCF,Rcont,kDegra,kMasFl,FIGURE,Nodes1,ND,kStruct,ApplStress,kSigma,varargin)%% COM_FIRE_MATLAB

% 20th March 2015
% Pietro Di Modica
% legend
%% Initiation
% Initialisation of all the matrices for the model.
% In this version I added k and Cp versus temperature dependency as a 
% polynomial function of Temperature rather than as a table of points. 

%clear;clc;close all;
TIME=cputime;%tic
% hCF=50; % Convective Heat Transfer Coefficient on the cold face (HTC) [W/(m^2 K)] 50 for pipes
Sigma=5.670373*10^(-8);%[W m?2 K?4
GasConst=8.3145;%[J K-1 mol-1]
fid=fopen('Simulation_Summary.txt','w+');
K='Sigma=5.670373*10^(-8) [W m^2 K^4] \n';
fprintf(fid, K);
K='GasConst=8.3145 [J K-1 mol-1] \n';
fprintf(fid, K);
status=fclose(fid);

%% This part should be enabled just to run COMFIRE internally then it should be transformed into comments for the GUY
% Jobname='Trial_CFRP_75_10';
% hCF=10;
% nFibre=2; % Fibre kind according to the material library
% nResin=3; % Resin kind according to the material library
% kCp=0; % Temperature dependency of the thermal properties: 0 single point values, 1 according to table, 2 according to polynomial script, 3 according RRC and rule of mixture; 4 according to Fraction of virgin material in the decomposig composite and Virgin-char properties VS Temperature
% volFr=0.66; % Fibre volume fraction
% Thickness=10; % [mm]
% Duration=3; % minutes (pipes 3min)
% FoUser=0.1;
% Tamb=24; % Starting temperature [C]  (Pipe: 12mm=26.7; 8mm=17)
% HF=2; % Hot Face boundary conditions key
% Flames=1;
% QFLUX=70; % Constant source Heat Flux [kW m-2] (Pipes 113.6kW)
% emisHtSo=0.8;
% absorpLam=0.8;
% emisLam=0.8;
% kSur=1; % Hot Face boundary condition option key
% kCF=1;  % Cold Face boundary condition option key
% Rcont=0;
% kDegra=1;
% kMasFl=1;
% FIGURE=1;
% Nodes1=11;
% % ND=[1,2,3]; % nodes to be displayed
% % ND=[1,2,3,4,5,6]; % nodes to be displayed
% ND=[2,3,5,7,9,11]; % nodes to be displayed
% % ND=[2,5,9,13,17,21]; % nodes to be displayed
% % ND=[2,6,11,16,21,26,31,36,41,46,51];
% 
%% This part should be inserted in the GUI for use by others.
%%Structural part
% kStruct=1; % Switch to enable structural prediction: 0 off; 1 on.
% kSigma=1; % Switch for structural model option: 0 = two layer model; 1 =  Average strength model.
% ApplStress=0.2*681; % Applied stress on the component [MPa]
% buser=100; % Width of the sample [mm]
% C=1; % End bondary condition constant: 0.25 one end fixed, one end free; 1 both end pivoted; 2 one fixed and the other pivoted; 4 both ends fixed. 
% Lcuser=100; % Unsupported Length of composite beam [mm]
% 
% % Material properties for 2 layer model
% CompCompFail=681.1; % Room temperature Composite compressive failure [MPa]
% CharCompFail=0;  % Room temperature Char compressive failure [MPa]
% CompCompMod=123200; % Room temperature Composite compression modulus [MPa]
% CharCompMod=0; % Room temperature Char compression modulus [MPa]
% 
% % Mechanical properties for average strength model
% sigmaU=681.1; % Unrelaxed compressive strength [MPa]
% sigma1R=500; % Relaxed compressive strength stage 1 [MPa]
% sigma2R=380; % Relaxed compressive strength stage 2 [MPa]
% sigma3R=0; % Relaxed compressive strength stage 3 [MPa]
% kstruct=1; % Broadness of the transition
% T1g=60; % Transition temperature stage 1 [°C]
% T2g=110; % Transition temperature stage 2 [°C]
% T3g=180; % Transition temperature stage 3 [°C]
% n=0.5; % RRC sensitivity
% 
% EcU=100000; % Unrelaxed compressive modulus [MPa] (datacheet for MTM44-1 is 123200)
% EcR=0; % Relaxed compressive modulus [MPa]
% kstructc=1; % Broadness of the transition
% nc=3; % RRC sensitivity
% Tgc=180; % Transition temperature stage 1 [°C]
% 
%% Reading input variables

assignFibre(nFibre);
assignResin(nResin);
kCpDependency(kCp);

Thickness=Thickness/1000; % [m]
fid = fopen('Simulation_Summary.txt','a+');
K=['Thickness: ',num2str(Thickness*1000),' [mm] \n'];
fprintf(fid, K);
status=fclose(fid);

Nodes=Nodes1;% It used to be fixed to 51 but it is too demanding for very thin laminates such as 2mm with non single point thermal properties
Deltax=Thickness/(Nodes-1);
fid = fopen('Simulation_Summary.txt','a+');
K=['Space increment: ',num2str(Deltax*1000),' [mm] \n'];
fprintf(fid, K);
status=fclose(fid);

Tamb=Tamb+273.15; % Starting temperature [K]
fid = fopen('Simulation_Summary.txt','a+');
K=['Starting temperature: ',num2str(Tamb),'[K] \n'];
fprintf(fid, K);
status=fclose(fid);

[QFLUX]=kFlames(Flames, HF, QFLUX);
if QFLUX>130000
    disp('Warning: This model does not consider reactions happening between polymer and fibres so results may not be very accurate for heat fluxes higher than 130 kW/m^2');
elseif QFLUX<15
    disp('Warning: This model does consider time dependent failure mechanisms such as creep so structural results may not be very accurate for heat fluxes lower than 15 kW/m^2');    
end


coldface(kCF);
if kCF==3
    load CopperProp
else
end

[kDegra,kMasFl]=Degradation(kDegra,kMasFl);

load Fibre;
load Resin;
    

[LAM_DENS,RWF,FW,LAM_SPHT,LAM_TCT,LHWVap,RW,RhoFNL]=Material_Properties(FIBRE_DENS,volFr,RESIN_DENS,FIBRE_SPHT,RESIN_SPHT,FIBRE_TCT,RESIN_TCT);

%% Air/gas properties to be used in case the thermal properties change in function fo the RRC
Air_TCT=0.02; % Air thermal conductivity [W/[m.K]]
Air_SPHT=2386.5; % Air specific heat capacity [J/[kg.K]]
Air_DENS=1.2; % Air density [kg/m^3]

%% To be activated when COMFIRE runs in the GUI and in the optimisation
%%loops for the Arrenious equation analysis.
if ~isempty(varargin)
    AA=varargin{1}; %varargin{1};
    disp (strcat('AA = ',num2str(AA),' [1/s]'));
    EE=varargin{2}; %varargin{2};
    disp (strcat('EE = ',num2str(EE),' [J/mol]'));
    H=varargin{3}; %varargin{3};
    disp (strcat('H = ',num2str(H),' [J/kg]'));
    RESIN_FNL=varargin{4}; %varargin{3};
    RWF = RW * RESIN_FNL;
    disp (strcat('RESIN_FINAL = ',num2str(RESIN_FNL),' [%]'));
    save('Resin','RESIN_FNL','AA','EE','H','-append')

else
end

%% old command
% load inputVariables
%%

Rho=LAM_DENS;
k=LAM_TCT;
Cp=LAM_SPHT;
alpha=k/(Rho*Cp);
R=absorpLam*Sigma*Deltax/k;
AreaSample=0.01;
%**************************************************************************
%%                         Stability criterions
%**************************************************************************
   % Condution
     FoCond=0.5; % Conduction limit Fo<0.5
   if HF==2
       if kSur==0
   % Radiation on the hot face
           FURNTEMP = nthroot((QFLUX/(emisHtSo*Sigma)),4);
           FoHF=1/(2*(1+R*emisHtSo*FURNTEMP^3)); % Radiation limit Fo<1/(2*(1+R*EmisHtSo*FURNTEMP^3))
           disp(['Radiation only on the Hot Face with Heat source temperature of ',num2str(FURNTEMP),' K = ',num2str(FURNTEMP-273.15),'°C']);
       elseif kSur==1
   % Convection+Radiation on the hot face
          FURNTEMP = nthroot((QFLUX/(emisHtSo*Sigma)),4);
          disp(['Radiation+Convection on the Hot Face with Heat source temperature of ',num2str(FURNTEMP),'K = ',num2str(FURNTEMP-273.15),'°C']);
          hHF=1.31*nthroot(abs(Tamb-FURNTEMP),3); % Maximum Convective Heat Transfer Coefficient on the cold face for Turbulent Flow (Applyed Thermodinamics, by T.D. Eastop & A. McConkey, 1978), (HTC) [W/(m^2 K)]
          BiHF=hHF*Deltax/k; % Biot number
          FoHF=1/(2*(1+BiHF+R*emisHtSo*FURNTEMP^3)); % Convection limit Fo<1/(2*(1+Bi+R*EmisHtSo*FURNTEMP^3))
       else
            error('myApp:argChk', ' HF boundary condition option out of boundary; choose 0 or 1')
       end
   end
     % Convection on the cold face
     BiCF=hCF(1)*Deltax/k; % Biot number
     FoCF=1/(2*(1+BiCF)); % Convection limit Fo<1/(2*(1+Bi))
     
     FoV=[FoUser,FoCond,FoHF,FoCF];
     Fo=min(FoV);
%**************************************************************************
%% Arrays initialization
NODES=cell(length(ND),1);
THICKNESS=cell(length(ND),1);
THICKNESS1=cell(length(ND)+1,1);THICKNESS1{1}=['Heat source'];
for i=1:length(ND)
    NODES{i}=num2str(ND(i));
    THICKNESS{i}=[num2str(Deltax*1000*(ND(i)-1)),' mm'];
    THICKNESS1{i+1}=[num2str(Deltax*1000*(ND(i)-1)),' mm'];
end

if kDegra==1
    Deltat=Fo*RhoFNL*Cp*(Deltax^2)/k; % time increment [s]
    Timesteps=1+(Duration*60)/Deltat;Timesteps=ceil(Timesteps);
    T=(Tamb)*ones(Timesteps,(Nodes+1));
    TCNODES=Tamb*ones(Timesteps,length(ND)); % Initialising Degree centigrade matrix for the nodes to be plotted

    Rho=Rho*ones(Timesteps,(Nodes+1));    % Laminate Density matrix
%     dRhodt=zeros(Timesteps,(Nodes));    % Rate of laminate density loss matrix
%     dRho=zeros(Timesteps,(Nodes));      % Laminate Density loss matrix
    RhoRes=RW*ones(Timesteps,(Nodes+1));  % Resin Density matrix
    dRhoResdt=zeros(Timesteps,(Nodes+1)); % Rate of resin density loss matrix
    dRhoRes=zeros(Timesteps,(Nodes+1));   % Resin Density lossmatrix
    RRC= ones(Timesteps,(Nodes+1));       % Remaining resin content matrix initialisation
    k=LAM_TCT*ones(Timesteps,(Nodes+1));
    Cp=LAM_SPHT*ones(Timesteps,(Nodes+1));
    if kMasFl==1
        GasFlowT=zeros(Timesteps,(Nodes+1));
        GasFlowVap=zeros(Timesteps,(Nodes+1));
        GasFlow1=zeros(Timesteps,(Nodes+1));
        GasFlow2=zeros(Timesteps,(Nodes+1));
        MassLossRate=zeros(Timesteps,1);
    else
    end
else
    Deltat=Fo*Rho*Cp*(Deltax^2)/k; % time increment [s]
    Timesteps=1+(Duration*60)/Deltat;Timesteps=ceil(Timesteps);
    T=(Tamb)*ones(Timesteps,(Nodes+1));
    TCNODES=Tamb*ones(Timesteps,length(ND)); % Initialising Degree centigrade matrix for the nodes to be plotted
end

% Initialization of thermal properties matrix at room temperature
if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
    if kDegra==0
        % this if statement is just because if the degradation effects are
        % not included k and Cp are not initialized as matrix
        Rho=Rho*ones(Timesteps,(Nodes+1));    % Laminate Density matrix
        k=LAM_TCT*ones(Timesteps,(Nodes+1));
        Cp=LAM_SPHT*ones(Timesteps,(Nodes+1));
    else
    end
    if kCp==1||kCp==2
       if kCp==1 % it uses the table data format as input
           [CpT,CpY,kT,kY]=LoadTempProp;
           [Cp1,k1]=TempProp((T(1,1)-273.15),CpT,CpY,kT,kY);
       elseif kCp==2 %it uses the function format in the m file
           [kCp1]=kCpVsTemp((T(1,1)-273.15));
           Cp1=kCp1(1);
           k1=kCp1(3);
       end
       Cp(:,:)=Cp1;
       k(:,:)=k1;
    else
    end
%     if kCp==3&&kDegra==1 OR kCp==4&&kDegra==1
%         % thermal properties are already initialised correctly
%     else
%     end
else
end



% HF boundary condition: constant Heat Flux
  % Stephan-Boltzman
hCF=ones(Timesteps,1)*hCF(1);

% Structural part
% if kStruct==1
%     if kSigma==0; % 2 layer model
% %         xChar=Deltax*zeros(Timesteps,(Nodes)); % Thickness of char
%     else
%     end
% else
%         
% end

%% Writing the input summary file

%        To be done


%% Calculation
% Time iteration
disp 'Starting calculation'
SimPercentage=10;% initial simulation percentage, in the forloop then it will be updated with increments of "PercIncr"
PercIncr=10;

for t=1:(Timesteps-1)
    
    % Through thickness iteration
    for x=1:Nodes
      % HF boundary node
        if x==1 % HF boundary node
            
%             disp('node 1');% Check to be enabled just to
%             check if it is executing the through thickness iteration
            if HF==0||HF==1||HF==2||HF==3||HF==4||HF==5||HF==6
                
               if HF==0 % Standard time-temperature curve, standard HydroCarbon curve is used
                T = @(t) 345*log10(8*t +1)+ Tamb;
                FURNTEMP=T(Deltat*t);
                % Flames feedback
                if Flames==1&&kMasFl==1&&kDegra==1
                    QFLUX=emisHtSo*Sigma*(FURNTEMP.^4); % Estimated heatflux of the Hydrocarbon fire for flames feedback
                    [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                    if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                        [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                    else
                        [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                    end
                else
                end

               elseif HF==1 % Room temperature data files is provided
                % To be inserted
               elseif HF==2 % Constant heat flux is provided
                   if Flames==1&&kMasFl==1&&kDegra==1
                       [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                       if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       else
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       end
                   else
                   end
               elseif HF==3 % SOLAS or standard time-temperature curve
                T = @(t) 345*log10(8*t +1)+ Tamb;
                FURNTEMP=T(Deltat*t);
%                 Flames feedback
                if Flames==1&&kMasFl==1&&kDegra==1
                    QFLUX=emisHtSo*Sigma*(FURNTEMP.^4); % Estimated heatflux of the Hydrocarbon fire for flames feedback
                    [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                    if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)
                        [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                    else
                        [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                    end
                else
                end
               elseif HF==4 %EN1991 external fire
                   T = @(t) @(t) 660*(1-0.687*exp(-.32*t)-0.313*exp(-3.8*t))+ Tamb;
                   FURNTEMP=T(Deltat*t);
                   %                 Flames feedback
                   if Flames==1&&kMasFl==1&&kDegra==1
                       QFLUX=emisHtSo*Sigma*(FURNTEMP.^4); % Estimated heatflux of the Hydrocarbon fire for flames feedback
                       [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                       if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       else
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       end
                   else
                   end
               elseif HF==5 % EN1991 Hydrocarbon fire
                   T = @(t) @(t) 1080*(1-0.325*exp(-.167*t)-0.675*exp(-2.5*t))+ Tamb;
                   FURNTEMP=T(Deltat*t);
                   %                 Flames feedback
                   if Flames==1&&kMasFl==1&&kDegra==1
                       QFLUX=emisHtSo*Sigma*(FURNTEMP.^4); % Estimated heatflux of the Hydrocarbon fire for flames feedback
                       [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                       if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       else
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       end
                   else
                   end
               elseif HF==6 % Large poolfire PD7974-3 2003
                   T = @(t) @(t) 1100*(1-0.325*exp(-.167*t)-0.204*exp(-1.417*t)-0.471*exp(-15.833*t))+ Tamb;
                   FURNTEMP=T(Deltat*t);
                   %                 Flames feedback
                   if Flames==1&&kMasFl==1&&kDegra==1
                       QFLUX=emisHtSo*Sigma*(FURNTEMP.^4); % Estimated heatflux of the Hydrocarbon fire for flames feedback
                       [QFLUXNEW]=kFlamesOut(Flames, HF, QFLUX,K_GM,GasFlowT(t,1),COMB_EFF);
                       if (kCp==1)||(kCp==2)||(kCp==3&&kDegra==1)
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       else
                           [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUXNEW,emisHtSo,Sigma,R,Tamb,Deltax,k(t,x));
                       end
                   else
                   end
               else
               end
               
                if kSur==0 % Radiation only
                    if kDegra==1
                      % It is changing the decomposition constants in the case of
                      % 2 stages decomposition behaviour
                        if nResin==4&&RhoRes(t,x)<=(RC12*RW)
                            EE=EE2;
                            AA=AA2;
                            H=H2;
                        else
                        end
                               
                      % Conduction term that takes into account the change in
                      % density and boundary conditions
                        FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                        RActual=(absorpLam*Sigma*Deltax/k(t,x));
                        T((t+1),x)=2*FoActual*(T(t,(x+1))+RActual*emisHtSo*FURNTEMP^4+((1/(2*FoActual))-1-RActual*(T(t,x)^3))*T(t,x));
                        
                      % Endothermic decomposition through Arrenius Equation
                        dRhoResdt(t,x)=-AA*(RhoRes(t,x)-RWF)*(exp(-EE/(GasConst*T(t,x))));
                        dRhoRes(t,x)=Deltat*dRhoResdt(t,x);
                        RhoRes((t+1),x)=RhoRes((t),x)+dRhoRes(t,x);
                        if RhoRes((t+1),x)<=RWF
                            RhoRes((t+1),x)=RWF;
                        else                    
                        end
                        Rho((t+1),x)=FW+RhoRes((t+1),x)*(1-volFr);
                      % (Decomposition energy+composite enthalpy-gas enthalpy) term
                        HT_GEN=SIHGF(H,kMasFl,Tamb,T(t,x),GAS_SPHT,LAM_SPHT);
                
                      % New temperature due to degradaton energy apport
                        T((t+1),x)=T((t+1),x)-dRhoRes(t,x)*HT_GEN/(Rho(t,x)*Cp(t,x));
                    else
                        T((t+1),x)=2*Fo*(T(t,(x+1))+R*emisHtSo*FURNTEMP^4+((1/(2*Fo))-1-R*(T(t,x)^3))*T(t,x));
                        
                    end
                elseif kSur==1 %Radiation+Convection
                    hHF=1.31*nthroot(abs(Tamb-FURNTEMP),3);
                    
                    if kDegra==1
                        % It is changing the decomposition constants in the case of
                        % 2 stages decomposition behaviour
                        if nResin==4&&RhoRes(t,x)<=(RC12*RW)
                            EE=EE2;
                            AA=AA2;
                            H=H2;
                        else
                        end
                        
                      % Conduction term that takes into account the change in
                      % density and boundary conditions
                        FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                        RActual=(absorpLam*Sigma*Deltax/k(t,x));
                        BiHF=hHF*Deltax/k(t,x); % Biot number
                        T((t+1),x)=2*FoActual*(T(t,(x+1))+BiHF*Tamb+RActual*emisHtSo*FURNTEMP^4+((1/(2*FoActual))-1-RActual*(T(t,x)^3))*T(t,x));

                        % Endothermic decomposition through Arrenius Equation
                        dRhoResdt(t,x)=-AA*(RhoRes(t,x)-RWF)*(exp(-EE/(GasConst*T(t,x))));
                        dRhoRes(t,x)=Deltat*dRhoResdt(t,x);
                        RhoRes((t+1),x)=RhoRes((t),x)+dRhoRes(t,x);
                        if RhoRes((t+1),x)<=RWF
                            RhoRes((t+1),x)=RWF;
                        else                    
                        end
                       Rho((t+1),x)=FW+RhoRes((t+1),x)*(1-volFr);
                     % (Decomposition energy+composite enthalpy-gas enthalpy) term
                       HT_GEN=SIHGF(H,kMasFl,Tamb,T(t,x),GAS_SPHT,LAM_SPHT);
                
                     % New temperature due to degradaton energy apport
                       T((t+1),x)=T((t+1),x)-dRhoRes(t,x)*HT_GEN/(Rho(t,x)*Cp(t,x));

                    else
                        
                        if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                            BiHF=hHF*Deltax/k(t,x); % Biot number
                        else
                            BiHF=hHF*Deltax/k; % Biot number
                        end
                        T((t+1),x)=2*Fo*(T(t,(x+1))+BiHF*Tamb+R*emisHtSo*FURNTEMP^4+((1/(2*Fo))-1-BiHF-R*(T(t,x)^3))*T(t,x));
                    end
                                        
                else
                    error('myApp:argChk', 'HF boundary condition option out of boundary; choose 0 or 1')
                end
            elseif HF==4 % Measured Hot Face data file is provided
% Algorithm to be inserted                
            else
                error('myApp:argChk', 'Heat source not defined')
            end
            
% Inner nodes, conduction term
        elseif x>=2&&x<Nodes 
            % Degradation terms
            if kDegra==1
               % It is changing the decomposition constants in the case of
               % 2 stages decomposition behaviour
                if nResin==4&&RhoRes(t,x)<=(RC12*RW)
                    EE=EE2;
                    AA=AA2;
                    H=H2;
                else
                end
                               
             % Conduction term that takes into account the change in
             % density
                FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                T((t+1),x)=FoActual*(T(t,(x-1))+T(t,(x+1))-2*T(t,x))+T(t,x);
               
              % Endothermic decomposition through Arrenius Equation
                dRhoResdt(t,x)=-AA*(RhoRes(t,x)-RWF)*(exp(-EE/(GasConst*T(t,x))));
                dRhoRes(t,x)=Deltat*dRhoResdt(t,x);
                RhoRes((t+1),x)=RhoRes((t),x)+dRhoRes(t,x);
                if RhoRes((t+1),x)<=RWF
                     RhoRes((t+1),x)=RWF;
                else                    
                end
                Rho((t+1),x)=FW+RhoRes((t+1),x)*(1-volFr);
              % (Decomposition energy+composite enthalpy-gas enthalpy) term
                HT_GEN=SIHGF(H,kMasFl,Tamb,T(t,x),GAS_SPHT,LAM_SPHT);
                
              % New temperature due to degradaton energy apport
                T((t+1),x)=T((t+1),x)-dRhoRes(t,x)*HT_GEN/(Rho(t,x)*Cp(t,x));
                
                if kMasFl==1 %TO BE CONTINUED AND CHECKED
                    
                % Heat transfer due to gaseous mass fow
                    
                    GasFlowT(t,x)=Deltax*(trapz((-dRhoResdt(t,x:Nodes))));
%                     GasFlowVap((t+1),x)=GasFlowVap(t,x)+trapz(Deltax*(x:Nodes),(-dRhoResdt(t,x:Nodes)));
%                     GasFlow1((t+1),x)=GasFlow1(t,x)+trapz(Deltax*(x:Nodes),(-dRhoResdt(t,x:Nodes)));
%                     GasFlow2((t+1),x)=GasFlow2(t,x)+trapz(Deltax*(x:Nodes),(-dRhoResdt(t,x:Nodes)));
                    
                    T((t+1),x)=T((t+1),x)+(GasFlowT(t,x)*GAS_SPHT*Deltat/(Rho(t,x)*Cp(t,x)))*((T((t+1),(x+1))-T((t+1),x))/Deltax);

                else
                end
                
            else
                %Just conduction term
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    T((t+1),x)=FoActual*(T(t,(x-1))+T(t,(x+1))-2*T(t,x))+T(t,x);
                else
                    T((t+1),x)=Fo*(T(t,(x-1))+T(t,(x+1))-2*T(t,x))+T(t,x);
                end
                
            end
            
%             disp(['node ',num2str(x)]);% Check to be enabled just to
%             check if it is executing the through thickness iteration

        else
            % Boundary node, Cold Face
            
%             disp (['node ',num2str(x)]);% Check to be enabled just to
%             check if it is executing the through thickness iteration

            if kCF==0 % Insulated cold face
                T(t,x+1)=T((t),Nodes-1);
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    dRhoResdt(t,x+1)=dRhoResdt(t,x-1);
                    dRhoRes(t,x+1)=dRhoRes(t,x-1);
                    RhoRes(t,x+1)=RhoRes(t,x-1);
                    k(t,x+1)=k(t,x-1);
                    Cp(t,x+1)=Cp(t,x-1);
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    T((t+1),x)=FoActual*(T(t,(x-1))+T(t,(x+1))-2*T(t,x))+T(t,x);

                else
                    T((t+1),x)=Fo*(T(t,(x-1))+T(t,(x+1))-2*T(t,x))+T(t,x);

                end
                
%                 disp kCF=0
                
            elseif kCF==1 %Natural convection+Free radiation
                hCF(t+1)=hCF(1)+0.03*T(t,x)+0.0001*(T(t,x)^2);
%                 hCF(t+1)=hCF(t)+0.03*(T(t,x)-T(t,(x+1)))+0.0001*((T(t,x)-T(t,(x+1)))^2);
                if kDegra==1
                    BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                else
                    if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                        BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                    else
                        BiCF=hCF(t)*Deltax/k; % Biot number
                    end
                end
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    RActual=(absorpLam*Sigma*Deltax/k(t,x));
                    T((t+1),x)=2*FoActual*(T(t,(x-1))+BiCF*T(t,(x+1))+RActual*T(t,(x+1))^4+((1/(2*FoActual))-1-BiCF-RActual*(T(t,x)^3))*T(t,x));
                else
                    T((t+1),x)=2*Fo*(T(t,(x-1))+BiCF*T(t,(x+1))+R*T(t,(x+1))^4+((1/(2*Fo))-1-BiCF-R*(T(t,x)^3))*T(t,x));
                end
                if T((t+1),x)<T(t,(x+1))
                    T((t+1),x)=T(t,(x+1));
                else
                end
%                 disp kCF=1
            elseif kCF==2 % attached to a steel plate
                disp (['kCF=2; Boundary condition not developped'])
            elseif kCF==3 % attached to a copper heat sink
                Q_CF=LAM_TCT*(T((t),(x-1))-T(t,x))/Deltax; %Heat flux coming outo of the cold face due to the thermal gradient [W/m^2]
                T((t+1),(x+1))=T(t,(x+1))+(Q_CF*A_CU*Deltat)/(Cp_CU*V_CU*Rho_CU); %Theoretical temperature increase in the copper block
                T((t+1),x)=T((t+1),(x+1));
                Tint=Rcont*Q_CF;              % Thermal gap due to the contact resistance [k]
                F=T((t+1),(x-1))-T((t+1),x);  % Theoretical Thermal gap between at the CF/Copper interface
                if F<Tint
                    Q_CU=0;
                else
                    Q_CU=LAM_TCT*(F-Tint)/Deltax;
                end
                T((t+1),(x+1))=T(t,(x+1))+(Q_CU*A_CU*Deltat)/(Cp_CU*V_CU*Rho_CU); %Theoretical temperature increase in the copper block
%                 disp kCF=3                
            elseif kCF==4 % just convection
                hCF(t+1)=hCF(1)+0.03*T(t,x)+0.0001*(T(t,x)^2);
%                 hCF(t+1)=hCF(1)+0.03*(T(t,x)-T(t,(x+1)))+0.0001*((T(t,x)-T(t,(x+1)))^2);
%                 hCF(t+1)=1.31*nthroot(abs(T(t,x)-T(t,x+1)),3);
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    BiCF=hCF(t+1)*Deltax./k(t,x); % Biot number
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    T((t+1),x)=2*FoActual*(T(t,(x-1))+BiCF*T(t,(x+1))+((1/(2*FoActual))-1-BiCF)*T(t,x));
                else
                BiCF=hCF(t+1)*Deltax./k; % Biot number    
                T((t+1),x)=2*Fo*(T(t,(x-1))+BiCF*T(t,(x+1))+((1/(2*Fo))-1-BiCF)*T(t,x));
                end
%                 QCOLD=k*(T(t+1,))
%                 disp kCF=4
            elseif kCF==5 % just radiation
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    RActual=(absorpLam*Sigma*Deltax/k(t,x));
                    T((t+1),x)=2*FoActual*(T(t,(x+1))+RActual*Tamb^4+((1/(2*FoActual))-1-RActual*(T(t.i)^3))*T(t,x));
                else
                    T((t+1),x)=2*Fo*(T(t,(x+1))+R*Tamb^4+((1/(2*Fo))-1-R*(T(t,x)^3))*T(t,x));
                end
%                 disp kCF=5
            elseif kCF==6 % attached to a liquid heat sink
                disp kCF=6
            elseif kCF==7
%                Constant convective heat transfer coefficient
                hCF(t+1)=hCF(1);
                if kDegra==1
                    BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                else
                    if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                        BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                    else
                        BiCF=hCF(t)*Deltax/k; % Biot number
                    end
                end
                if kCp==1||kCp==2||(kCp==3&&kDegra==1)||(kCp==4&&kDegra==1)
                    BiCF=hCF(t)*Deltax/k(t,x); % Biot number
                    FoActual=(k(t,x)*Deltat/(Rho(t,x)*Cp(t,x)*(Deltax^2)));
                    RActual=(absorpLam*Sigma*Deltax/k(t,x));
                    T((t+1),x)=2*FoActual*(T(t,(x-1))+BiCF*T(t,(x+1))+RActual*T(t,(x+1))^4+((1/(2*FoActual))-1-BiCF-RActual*(T(t,x)^3))*T(t,x));
                else
                    T((t+1),x)=2*Fo*(T(t,(x-1))+BiCF*T(t,(x+1))+R*T(t,(x+1))^4+((1/(2*Fo))-1-BiCF-R*(T(t,x)^3))*T(t,x));
                end
                if T((t+1),x)<T(t,(x+1))
                    T((t+1),x)=T(t,(x+1));
                else
                end
%                 disp kCF=7
            else
                error('myApp:argChk', 'CF boundary condition option out of boundary; choose 0 or 1')
            end
%         else
%             error('myApp:argChk', 'something strange in the through thickness dimension is happening')
        end
    end
    
%% Updates of thermal propertie for next time step calculation.
if kDegra==1
    RRC(t+1,:)=RhoRes(t+1,:)/RW; %previously was "RhoRes(t,i)/LAM_DENS"
else
end
%%Updating thermal properties according to Table or polynomial function

    if kCp==1||kCp==2
        if kCp==1
            [Cp2,k2]=TempProp((T((t+1),:)-273.15),CpT,CpY,kT,kY);
        elseif kCp==2
            for i=1:(Nodes+1)
                kCp1(i,:)=kCpVsTemp(T((t+1),i)-273.15);
            end
            Cp2=kCp1(:,1)';
            k2=kCp1(:,3)';
        end
        Cp((t+1),:)=Cp2;
        k((t+1),:)=k2;
    else
    end
    
%%Updating thermal properties according to RRC assuming that the decomposed
%%part becomes air/gas, see properties at the beginning of the script
    if kCp==3&&kDegra==1
%         for i=1:(Nodes+1)
%             RRC(t,:)=RhoRes(t,:)/RW; %previously was "RhoRes(t,i)/LAM_DENS"
%             [LAM_DENS,RWF,FW,LAM_SPHT,LAM_TCT,LHWVap,RW,RhoFNL,LAM_SPHT2,LAM_TCT2]=Material_Properties(FIBRE_DENS,volFr,RESIN_DENS,FIBRE_SPHT,RESIN_SPHT,FIBRE_TCT,RESIN_TCT,RRC(t,i));
            % Specific heat capacity function of the Remaining Resin Content
            SPHT12 = volFr .* FIBRE_SPHT .* FIBRE_DENS + RRC(t,:) .* (1-volFr) .* RESIN_SPHT .* RESIN_DENS + (1-RRC(t,:)) .* (1-volFr) .* Air_SPHT .* Air_DENS;
            SPHT22 = volFr .* FIBRE_DENS + RRC(t,:) .* (1-volFr) .* RESIN_DENS + (1-RRC(t,:)) .* (1-volFr) .* Air_DENS;
            LAM_SPHT2 = SPHT12 ./ SPHT22;

            % Thermal conductivity function of the Remaining Resin Content
            TCT12 = volFr ./ FIBRE_TCT + (RRC(t,:) .* (1-volFr)) ./ RESIN_TCT + (1-RRC(t,:)).*(1-volFr)./Air_TCT;
            LAM_TCT2 = 1 ./ TCT12;

            Cp((t+1),:)=LAM_SPHT2;
            k((t+1),:)=LAM_TCT2;
%         end

    else
    end

%------------------------------------------------------------------------
% Rule of mixture applied at hight temperatures considering the material as
% homogeneous and made of the virgin and carred properties function of
% temperature
%------------------------------------------------------------------------
 % Formulas from Mouritz book, pages 153-156, it has to have both
 % virgin and char properties as function of temperature to be used
 %         kp=kv*kc/(kv*(1-Vv)+kc*Vv);
 %         Cpp=Cpv*Vv+Cpc*(1-Vv);

    if kCp==4&&kDegra==1
        Vv=(Rho(t+1,:)-RhoFNL)/(LAM_DENS-RhoFNL); %Vector representing the fraction of virgin material in the decomposing composite
        for i=1:(Nodes+1)
            kCp1(i,:)=kCpVsTemp(T((t+1),i)-273.15);
        end
        Cpv=kCp1(:,1)'; % Virgin Specific heat capacity 
        kv=kCp1(:,3)'; % Virgin Thermal conductivity 
        Cpc=kCp1(:,2)'; % Char Specific heat capacity 
        kc=kCp1(:,4)'; % Char Thermal conductivity
        
        kp=kv.*kc./(kv.*(1-Vv)+kc.*Vv); % Thermal conductivity of the decomposing composite
        Cpp=Cpv.*Vv+Cpc.*(1-Vv); % Specific heat capacity of the decomposing composite
                
        Cp((t+1),:)=Cpp;
        k((t+1),:)=kp;
    else
    end

    
    if kDegra==1&&kMasFl==1
        MassLossRate(t)=GasFlowT(t,1);
    else
    end
    
%     It displays the simulation progression in terms of percentage
    SimStage=(t/Timesteps)*100;
    if SimStage==SimPercentage
        disp(['Simulation status = ',num2str(SimPercentage),'%']);
        SimPercentage=SimPercentage+PercIncr;
    else
    end
    
%     disp (['Time iteration ', num2str(t),' of ',num2str(Timesteps),' timesteps.'])
end

SimulationDuration=(cputime-TIME);%elpsedtime=toc;elapsedtime=elpsedtime/60;
[Minutes,Seconds]=sec2time(SimulationDuration);

disp 'Calculation complete'
%% Post processing

%%Thermal post processing
InitialMass=LAM_DENS*(AreaSample*Thickness);          % Total mass of the specimen [kg]

TC=T-273.15;
Time=(0:Deltat:(Deltat*(Timesteps-1)));
if HF==0
    FurnTemp=T(Time);
elseif HF==1
elseif HF==2
    FurnTemp=ones(length(Time),1)*FURNTEMP-273.15;
end

% for f=1
    for i=1:length(ND)
        TCNODES(:,i)=TC(:,ND(i));
    end
% for f=1    
% if FIGURE==1
% % figure(FIGURE);plot(Time,FurnTemp,Time,TC(:,ND(1)),Time,TC(:,ND(2)),Time,TC(:,ND(3)),Time,TC(:,ND(4)),Time,TC(:,ND(5)),Time,TC(:,ND(6)),Time,TC(:,ND(7)));legend('Heat source temperature','Hot Face','Node 2','Node 3','Node 4','Node 5','Node 6','Cold Face');
% figure(FIGURE);plot(Time,FurnTemp,Time,TCNODES);legend('Heat source temperature','Hot Face','Node 2','Node 3','Node 4','Node 5','Cold Face');
% xlabel 'Time [sec]';ylabel 'Temperature [°C]';title('Calculated temperature');
% else
% end

if kDegra==1&&kMasFl==1
%     figure(gcf+1);plot(Time,GasFlowT(:,2));xlabel('Time [sec]');ylabel('Mass loss [kg/m^2s]');title('Mass loss');
    TotalMassLoss=AreaSample*Deltat*trapz(GasFlowT(:,2)); % Total mass loss at the end of simulation [kg]
    HRR=K_GM*GasFlowT(:,2)/1000;
%         figure(gcf+1);plot(Time,K_GM*GasFlowT(:,2)/1000);xlabel('Time [sec]');ylabel('HRR [kW/m^2]');title('HRR');
% legend('Heat source','Hot Face', 'nd2','nd3','nd4','nd5','nd6','Cold Face','Location','SouthEast')
end
% [TIME3D,NODE]=meshgrid(Time,(1000*Deltax*(0:(Nodes-1))));
% figure(gcf+1);surf(TIME3D,NODE,(TC(:,1:ND(end)))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;
% figure(gcf+1);mesh(TIME3D,NODE,(TC(:,1:ND(end)))');xlabel('Time [sec]');ylabel('Thickness [mm]');zlabel('Temperatures [°C]');title('Calculated temperature');%axis ij;

%%Structural post processing

if kStruct==0||kDegra==0
    disp ('No structural calculation performed');
    if kDegra==0
        disp('because of no degradation effects included');
    else
    end
else
    %%Loading to be enabled only for optimisation or GUI execution
    load('Structural_Properties.mat');
    
    b=buser/1000; % Width of the sample converted into [m]
    Lc=Lcuser/1000;
    
    xChar=Deltax*(1-RRC(:,1:(end-1)))./(1-RESIN_FNL);
    CharLayer=sum(xChar,2);
    CharProp=CharLayer/Thickness;
    if kSigma==0 % 2 layer model
        sigmaAv=CompCompFail.*(1-CharProp) + CharCompFail.*CharProp;
%         sigma=CompCompFail.*(1-(1-RRC)./(1-RESIN_FNL)) + CharCompFail.*(1-RRC)./(1-RESIN_FNL);
        Ec=CompCompMod.*(1-CharProp) + CharCompMod.*CharProp;
        sigmaEul=(((pi^2).*C.*(Ec.*1000000).*b.*(Thickness.*(1-CharProp)).^3)./(12.*Lc.^2))./(1000000*b.*Thickness);

    elseif kSigma==1 % Average strength model
        %%Average strength model with one transition temperatures.
        if  isa(sigmaU,'function_handle')
            sigma=0.5.*((sigmaU(TC(:,1:(end-1)))+sigma1R)-(sigmaU(TC(:,1:(end-1)))-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))).*RRC(:,1:(end-1)).^n;
        else
            sigma=0.5.*((sigmaU+sigma1R)-(sigmaU-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))).*RRC(:,1:(end-1)).^n;
        end
        if  isa(EcU,'function_handle')
            Ec=0.5.*((EcU(TC(:,1:(end-1)))+EcR)-(EcU(TC(:,1:(end-1)))-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        else
            Ec=0.5.*((EcU+EcR)-(EcU-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        end
        sigmaAv=sum(sigma,2)/Nodes;
        sigmaEul=(((pi^2).*C.*((sum(Ec,2)/Nodes).*1000000).*b.*(Thickness.*(1-CharProp)).^3)./(12.*Lc.^2))./(1000000*b.*Thickness); % [MPa]

    elseif kSigma==2 % Average strength model
        %%Average strength model with two transition temperatures.
        if  isa(sigmaU,'function_handle')
            sigma=0.5.*((sigmaU(TC(:,1:(end-1)))+sigma2R)-(sigmaU(TC(:,1:(end-1)))-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))-(sigma1R-sigma2R).*tanh(kstruct.*(TC(:,1:(end-1))-T2g))).*RRC(:,1:(end-1)).^n;
        else
            sigma=0.5.*((sigmaU+sigma2R)-(sigmaU-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))-(sigma1R-sigma2R).*tanh(kstruct.*(TC(:,1:(end-1))-T2g))).*RRC(:,1:(end-1)).^n;
        end
        if  isa(EcU,'function_handle')
            Ec=0.5.*((EcU(TC(:,1:(end-1)))+EcR)-(EcU(TC(:,1:(end-1)))-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        else
            Ec=0.5.*((EcU+EcR)-(EcU-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        end
        sigmaAv=sum(sigma,2)/Nodes;
        sigmaEul=(((pi^2).*C.*((sum(Ec,2)/Nodes).*1000000).*b.*(Thickness.*(1-CharProp)).^3)./(12.*Lc.^2))./(1000000*b.*Thickness); % [MPa]

    elseif kSigma==3 % Average strength model
        %%Average strength model with three transition temperatures.
        if  isa(sigmaU,'function_handle')
            sigma=0.5.*((sigmaU(TC(:,1:(end-1)))+sigma3R)-(sigmaU(TC(:,1:(end-1)))-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))-(sigma1R-sigma2R).*tanh(kstruct.*(TC(:,1:(end-1))-T2g))-(sigma2R-sigma3R).*tanh(kstruct.*(TC(:,1:(end-1))-T3g))).*RRC(:,1:(end-1)).^n;
        else
            sigma=0.5.*((sigmaU+sigma3R)-(sigmaU-sigma1R).*tanh(kstruct.*(TC(:,1:(end-1))-T1g))-(sigma1R-sigma2R).*tanh(kstruct.*(TC(:,1:(end-1))-T2g))-(sigma2R-sigma3R).*tanh(kstruct.*(TC(:,1:(end-1))-T3g))).*RRC(:,1:(end-1)).^n;
        end
        if  isa(EcU,'function_handle')
            Ec=0.5.*((EcU(TC(:,1:(end-1)))+EcR)-(EcU(TC(:,1:(end-1)))-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        else
            Ec=0.5.*((EcU+EcR)-(EcU-EcR).*tanh(kstructc.*(TC(:,1:(end-1))-Tgc))).*RRC(:,1:(end-1)).^nc;
        end
        sigmaAv=sum(sigma,2)/Nodes;
        sigmaEul=(((pi^2).*C.*((sum(Ec,2)/Nodes).*1000000).*b.*(Thickness.*(1-CharProp)).^3)./(12.*Lc.^2))./(1000000*b.*Thickness); % [MPa]
    else
        disp ('No structural model has been chosen');
    end
    if  ~isempty(sigmaAv)
        % plotting Structural results
        ApplStress1=ApplStress./(1-CharProp); %New applied stresses function of the char layer advancement 
        TTF1=find(sigmaAv<=ApplStress1);
        TTF2=find(sigmaEul<=ApplStress1);
        if isempty(TTF1)&&isempty(TTF2)
            TTF=nan;
            TTB=nan;
            disp('No failure during simulation duration. ')
%             figure(gcf+1);plot(Time,sigmaAv,Time,sigmaEul);title('Resisdual strength VS Time');
%             xlabel('Time [s]');ylabel('Residual strength [MPa]');legend('Residual strength','Residual buckling strength');
            if kSigma==0
                disp(['Residual strength according to 2 layer model at the end = ' num2str(sigmaAv(end)),' [MPa]']);
                disp(['Eulerian buckling stresses according to 2 layer model at the end = ' num2str(sigmaEul(end)),' [MPa]']);
            elseif kSigma==1
                disp(['Residual strength according to average strength model at the end = ' num2str(sigmaAv(end)),' [MPa]']);
                disp(['Eulerian buckling stresses according to average strength model at the end = ' num2str(sigmaEul(end)),' [MPa]']);
            elseif kSigma==2
                disp(['Residual strength according to average strength model at the end = ' num2str(sigmaAv(end)),' [MPa]']);
                disp(['Eulerian buckling stresses according to average strength model at the end = ' num2str(sigmaEul(end)),' [MPa]']);
            elseif kSigma==3
                disp(['Residual strength according to average strength model at the end = ' num2str(sigmaAv(end)),' [MPa]']);
                disp(['Eulerian buckling stresses according to average strength model at the end = ' num2str(sigmaEul(end)),' [MPa]']);
            end
        elseif isempty(TTF1)&&~isempty(TTF2)
            TTB=Deltat*(TTF2(1)-1);TTF=nan;
            disp(['Time to Failure = ', num2str(TTF),' seconds']);
            disp(['Time to Buckling = ', num2str(TTB),' seconds']);
%             figure(gcf+1);plot(Time,sigmaAv,Time,sigmaEul,TTB,sigmaEul(TTF2(1)),'ro');title('Resisdual strength VS Time');
%             xlabel('Time [s]');ylabel('Residual strength [MPa]');legend('Residual strength','Residual buckling strength','Time to Buckling');
        elseif ~isempty(TTF1)&&isempty(TTF2)
            TTF=Deltat*(TTF1(1)-1);TTB=nan;
            disp(['Time to Failure = ', num2str(TTF),' seconds']);
            disp(['Time to Buckling = ', num2str(TTB),' seconds']);
%             figure(gcf+1);plot(Time,sigmaAv,Time,sigmaEul,TTF,sigmaAv(TTF1(1)),'b*');title('Resisdual strength VS Time');
%             xlabel('Time [s]');ylabel('Residual strength [MPa]');legend('Residual strength','Residual buckling strength','Time to Failure');
        else
            TTF=Deltat*(TTF1(1)-1);TTB=Deltat*(TTF2(1)-1);
            disp(['Time to Failure = ', num2str(TTF),' seconds']);
            disp(['Time to Buckling = ', num2str(TTB),' seconds']);
%             figure(gcf+1);plot(Time,sigmaAv,Time,sigmaEul,TTF,sigmaAv(TTF1(1)),'b*',TTB,sigmaEul(TTF2(1)),'ro');title('Resisdual strength VS Time');
%             xlabel('Time [s]');ylabel('Residual strength [MPa]');legend('Residual strength','Residual buckling strength','Time to Failure','Time to Buckling');
        end
    end
end

%% Saving all results
name=Jobname;% old instruction name=strcat(Jobname,'_Results for sample_thickness_of_',num2str(Thickness*1000),'_mm.mat');
save(name);
% name=strcat(Jobname,'Results for sample_thickness_of_',num2str(Thickness*1000),'_mm.txt');
% save(name,'-ascii', '-double', '-tabs');


end