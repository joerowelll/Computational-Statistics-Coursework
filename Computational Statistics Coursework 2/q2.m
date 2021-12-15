%q2.m
%a) Categorical data was recorded in this study, both surgery type and
%survival are categorical data types.
%b)
load('surgery.mat');
load('surgery.mat', 'surgery');
%T=traditional, R=robotic
load('surgery.mat', 'survival');
%A=alive, D=dead
Tpos=find(surgery=='T');
Rpos=find(surgery=='R');
Apos=find(survival=='A');
Dpos=find(survival=='D');
Tsuccess=0;
Rsuccess=0;
Tfail=0;
Rfail=0;
for i=1:length(surgery);
    if (surgery(i)=='T' )&& (survival(i)=='A')
        Tsuccess=Tsuccess+1;
    end
    if (surgery(i)=='T' )&& (survival(i)=='D')
        Tfail=Tfail+1;
    end
    if (surgery(i)=='R' )&& (survival(i)=='A')
        Rsuccess=Rsuccess+1;
       
    end
    if (surgery(i)=='R' )&& (survival(i)=='D')
        Rfail=Tfail+1;
    end
end
c = categorical({'Tsuccess','Rsuccess','Tfail','Rfail'});
y=([Tsuccess,Rsuccess, Tfail, Rfail]);
figure
bar(c,y);
xlabel('Surgery type and result');
ylabel('Frequency');
title('Robotic vs traditonal surgery');
%c) 
Rsurvivalrate= Rsuccess/(Rsuccess +Rfail);
Tsurvivalrate= Tsuccess/(Tsuccess+Tfail);
%The robotic surgery survival rate is higher than that of the traditional
%surgery. Two sample unpaired categorical data.






