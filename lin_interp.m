function [out]=lin_interp(TCCP,XY,TCCURR)
% This function finds the two nearest values to the input temperature
% (TCCURR) and linearly interpolates the property (out).

% TCCURR is the value at which the property represented by XY is evaluated.
% TCCP and XY are the independent and dependent variable respectively.
% out is the interpolated value.

x=length(TCCURR);
out=zeros(1,x);

for j=1:x
    if TCCP(1)>TCCURR(j)
        out(j)=XY(1);
%         disp('Temperature lower than the tabled. Properties constant at the lower temperature. Calculation contiues.')
    else 
        a=find(TCCP==TCCURR(j));
        b=find(TCCP>TCCURR(j));
        if a>0
        out(j)=XY(a);
        elseif b>0
            out(j)=XY((b(1)-1))+((XY(b(1))-XY((b(1)-1)))/(TCCP(b(1))-TCCP((b(1)-1))))*(TCCURR(j)-TCCP((b(1)-1)));
        else
            out(j)=XY(length(TCCP));
%             disp('Temperature higher than the tabled. Properties constant at the higher temperature. Calculation contiues.')

        end
    end
end
end