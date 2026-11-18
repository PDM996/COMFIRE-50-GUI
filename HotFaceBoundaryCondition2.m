function [FURNTEMP,FoHF,hHF,BiHF]=HotFaceBoundaryCondition2(kSur,QFLUX,emisHtSo,Sigma,R,Tamb,Deltax,k)
   if kSur==0
   % Radiation on the hot face
     FURNTEMP = nthroot((QFLUX/(emisHtSo*Sigma)),4);
     FoHF=1/(2*(1+R*emisHtSo*FURNTEMP^3)); % Radiation limit Fo<1/(2*(1+R*EmisHtSo*FURNTEMP^3))
%      disp(['Radiation only on the Hot Face with Heat source temperature of ',num2str(FURNTEMP),' K']);
   elseif kSur==1
   % Convection+Radiation on the hot face
     FURNTEMP = nthroot((QFLUX/(emisHtSo*Sigma)),4);
%      disp(['Radiation+Convection on the Hot Face with Heat source temperature of ',num2str(FURNTEMP),' K']);
     hHF=1.31*nthroot(abs(Tamb-FURNTEMP),3); % Maximum Convective Heat Transfer Coefficient on the cold face for Turbulent Flow (Applied Thermodinamics, by T.D. Eastop & A. McConkey, 1978), (HTC) [W/(m^2 K)]
     BiHF=hHF*Deltax/k; % Biot number
     FoHF=1/(2*(1+BiHF+R*emisHtSo*FURNTEMP^3)); % Convection limit Fo<1/(2*(1+Bi+R*EmisHtSo*FURNTEMP^3))
   else
       error('myApp:argChk', 'boundary condition option out of boundary; choose 0 or 1')
   end
end