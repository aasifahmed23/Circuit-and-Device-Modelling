%%
clc; clear all; close all;
% % K=1.38*10^-23; T=300; 
% % q=1.6*10^-19; % electronic change
% % Eg=1.12; %Bandgap (in eV)
% % Persi=11.9*8.854*10^-14; %Si permitivity
% % Perox=3.9*8.85*10^-14; %SiO2 permitivity
Na=1e21; %$$$$$$ Body doping(Acceptor) Doping concentration 
% % Nd=5e27; %$$$$ Source/Drain  concentration
% % Ni=(1.5e10)*(1e-6); % intrinsic Carrier Conc
% % %########STRUCTURAL PARAMETERS###############
tf=2e-9; %$$$$$ front oxide thickness 5e-9
% % tb=2e-9; %$$$$ back oxide thickness 50e9
tsi=5e-9; %$$$$ thin film thickness 150e-9
L1=10e-9; %$$$$$$ Channel length under gate M1
L2=10e-9; %$$$$$$$ Channel length under gate M2
% % L=L1+L2; %Total channel length
% % %#########BIAS VOLTAGES##############
% % Vgs=0.35;
Vds=0.3;
% % Vsub=0;
% % Vdd=1.8;
% % %########################
% % %Metal Work Function(in eV)
phim1=5.25;%$$$$$$$ Work funcction of M1 4.77
phim2=4.17;%$$$$$$$ Work funcction of M2 4.1
% % phit=(K*T)/q; %Thermal voltage
% % phif=phit*log(Na/Ni);  %p type substrate Fermi Potential
% % phis=4.05+(Eg/2)+phif; %p type substrate-Work_function
% % Vfb1=phim1-phis; %Flatband voltage under gate M1
% % Vfb2=phim2-phis; %Flatband voltage under gate M2
% % VfBb=Vfb2;%Back gate Flatband voltage
% % %#######################
% % Vg1=Vgs-Vfb1;% Vg1' 
% % Vg2=Vgs-Vfb2;% Vg2'
% % VGSb=Vgs-VfBb;% VGSb'
% % Vbi=(Eg/2)+phit*log((Na)/(Ni)); %In built potential across body source junction
% % Cb=Perox/tb; %Back oxide capacitance
% % Cf=Perox/tf; %Front oxide capacitance
% % Csi=Persi/tsi; %Thin film capacitance
% % Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
% % Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*VGSb)/((tsi^2)*(1+(2*Csi)/Cb)));
% % Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*VGSb)/((tsi^2)*(1+(2*Csi)/Cb)));
% % Sigma1=Beta1/Alpha;
% % Sigma2=Beta2/Alpha;
% % lambda1=sqrt(Alpha); % lambda1=eta 
% % lambda2=-lambda1; % lambda2=-eta
% % %#####################################
% % A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(-lambda1*L))/(1-exp(-2*lambda1*L));
% % B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(-2*lambda1*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(-lambda1*L))/(1-exp(-2*lambda1*L)));
% % C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
% % D=(B*exp(-lambda1*L1))-((Sigma1-Sigma2)/2);
% % %##########################################
% % x=0:.01e-9:L; 
% % phis1=(A*exp(lambda1*x))+(B*exp(lambda2*x))-Sigma1;
% % phis2=(C*exp(lambda1*(x-L1)))+(D*exp(lambda2*(x-L1)))-Sigma2;
% % phis=phis1+phis2;
% % %##############################
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1);
x=0:.01e-9:20e-9; 
for Vds=0.1:0.1:1.8;    
plot(x/(1e-9),phi_x(Na,tf,tsi,L1,L2,Vds,phim1,phim2),'Parent',axes1,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length(in nm) ');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different Vds');
end
%%
% Create figure(Surface Potential vs Channel Length for different phim1)
figure2 = figure;
% Create axes
axes2 = axes('Parent',figure2);
% Surface potential v/s Channel length plots
x=0:.01e-9:20e-9; 
for Na=0.7e21:0.2e21:1.3e21; 
plot(x/(1e-9),phi_x(Na,tf,tsi,L1,L2,Vds,phim1,phim2),'Parent',axes2,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different phim1');
end
%%
% Create figure(Surface Potential vs Channel Length for different L1&L2)
figure3 = figure;

% Create axes
axes3 = axes('Parent',figure3);
% Surface potential v/s Channel length plots
% Na = Acceptor Conc; Nd = Donor Conc; Ni = intrinsic Carrier Conc ; Eg =
% Bandgap; Persi = Permittivity of Si ; Perox = Pemittivity of Oxide.
K=1.38*10^-23; T=300; Ni=(1.5e9)*(1e-6); q=1.6*10^-19; Eg=1.12;
Persi=11.8*(8.854*10^-14); Perox=3.9*(8.85*10^-14);
Na=(6e16)*(1e-6); %Nd=1*10^30;
tf=5*10^-9; tb=450*10^-9; tsi=150*10^-9;

%Specificatons of Diff. Parameters
L=0.2*10^-6;
x=0:0.01*10^-6:L;
%Terminal Potential
Vds=0.25;
Vgs=0.15; Vsub=0;
%gamma=Persi/Perox;
%phim=Metal Work Function
phim1=4.77;
phim2=4.1;
%Calculation of values which will be same for two regions
%phit=thermal voltage;Vfb=Flat Band Voltage;phif=Fermi Potential;
phit=(K*T)/q;
phif=phit*log(Na/Ni);  %p type substrate Fermi Potential
phis=4.05+(Eg/2)+phif; %p type substrate-Work_function
Vfb1=phim1-phis;
Vfb2=phim2-phis;
Vfbb=0; %Bach-Channel Flat Band Voltage
Vbi=(Eg/2)+phit*log((Na)/(Ni));
Vg1=Vgs-Vfb1;
Vg2=Vgs-Vfb2;
Vsub2=Vsub-Vfbb;
Cf=Perox/tf;
Cb=Perox/tb;
Csi=Persi/tsi;
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
lambda1=sqrt(Alpha);
lambda2=-lambda1;
Sigma1=Beta1/Alpha;
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
Sigma2=Beta2/Alpha;
for L1=0.08e-6:0.02e-6:0.12e-6;
%L1=0.12*10^-6;
L2=L-L1;
A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(2*lambda2*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(lambda2*L1))-((Sigma1-Sigma2)/2);
phis1=(A*exp(lambda1.*x))+(B*exp(lambda2.*x))-Sigma1;
phis2=(C*exp(lambda1.*(x-L1)))+(D*exp(lambda2.*(x-L1)))-Sigma2;
phi=phis1+phis2;
plot(x/(1e-6),phi,'Parent',axes3,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different L1&L2');
end
%%
% Create figure(Surface Potential vs Channel Length for different Na)
figure4 = figure;

% Create axes
axes4 = axes('Parent',figure4);
% Surface potential v/s Channel length plots
% Na = Acceptor Conc; Nd = Donor Conc; Ni = intrinsic Carrier Conc ; Eg =
% Bandgap; Persi = Permittivity of Si ; Perox = Pemittivity of Oxide.
K=1.38*10^-23; T=300; Ni=(1.5*10^10)*(1e-6); q=1.6*10^-19; Eg=1.12;
Persi=11.8*8.854*10^-14; Perox=3.9*8.85*10^-14;
Nd=1*10^30;
tf=5*10^-9; tb=450*10^-9; tsi=150*10^-9;
Cf=Perox/tf;
Cb=Perox/tb;
Csi=Persi/tsi;
gamma=Persi/Perox;
%Specificatons of Diff. Parameters
L=0.2*10^-6;
L1=L/2;L2=L/2;
x=0:0.01*10^-6:L;
%Terminal Potential
Vds=0.65;
Vgs=0.25; Vsub=0;
for Na=(6*10^16):(1*10^16):(1*10^17); 
%phim=Metal Work Function
phim1=4.77; phim2=4.1;
%Calculation of values which will be same for two regions
%phit=thermal voltage;Vfb=Flat Band Voltage;phif=Fermi Potential;
phit=(K*T)/q;
phif=phit*log(Na/Ni);
phis=4.05+(Eg/2)+phif;
Vfb1=phim1-phis;
Vfb2=phim2-phis;
Vfbb=0;
Vbi=(Eg/2)+phit*log(Na/Ni);
Vg1=Vgs-Vfb1;
Vg2=Vgs-Vfb2;
Vsub1=Vsub-Vfbb;
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
lambda1=sqrt(Alpha);
lambda2=-lambda1;
Sigma1=Beta1/Alpha;
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
Sigma2=Beta2/Alpha;
A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(2*lambda2*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(lambda2*L1))-((Sigma1-Sigma2)/2);
phis1=(A*exp(lambda1.*x))+(B*exp(lambda2.*x))-Sigma1;
phis2=(C*exp(lambda1.*(x-L1)))+(D*exp(lambda2.*(x-L1)))-Sigma2;
phi=phis1+phis2;
%X=x./L;
plot(x/(1e-6),phi,'Parent',axes4,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different Na');
end
%%
% Create figure(Surface Potential vs Channel Length for different tf)
figure5 = figure;

% Create axes
axes5 = axes('Parent',figure5);
% Surface potential v/s Channel length plots
% Na = Acceptor Conc; Nd = Donor Conc; Ni = intrinsic Carrier Conc ; Eg =
% Bandgap; Persi = Permittivity of Si ; Perox = Pemittivity of Oxide.
K=1.38*10^-23; T=300; Ni=1.5*10^10*(1e-6); q=1.6*10^-19; Eg=1.12;
Persi=11.8*8.854*10^-14; Perox=3.9*8.85*10^-14;
Na=6*10^16*(1e-6); Nd=1*10^30;
tb=450*10^-9; tsi=150*10^-9;
%phim=Metal Work Function
phim1=4.77; phim2=4.1;
%Specificatons of Diff. Parameters
L1=.15*10^-6; L2=.15*10^-6;
L=L1+L2;
x=0:.02*10^-6:L;
gamma=Persi/Perox;
Cb=Perox/tb;
Csi=Persi/tsi;
%Terminal Potential
Vds=0.25;
Vgs=0.15; Vsub=0;
%Calculation of values which will be same for two regions
%phit=thermal voltage;Vfb=Flat Band Voltage;phif=Fermi Potential;
phit=(K*T)/q;
phif=phit*log(Na/Ni);
phis=4.05+(Eg/2)+phif;
Vfb1=phim1-phis;
Vfb2=phim2-phis;
Vfbb=0;
Vbi=(Eg/2)+phit*log(Na/Ni);
Vg1=Vgs-Vfb1;
Vg2=Vgs-Vfb2;
Vsub2=Vsub-Vfbb;
for tf=50*10^-9:5*10^-9:100*10^-9;
Cf=Perox/tf;
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
lambda1=sqrt(Alpha);
lambda2=-lambda1;
Sigma1=Beta1/Alpha;
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
Sigma2=Beta2/Alpha;
A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(2*lambda2*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(lambda2*L1))-((Sigma1-Sigma2)/2);
phis1=(A*exp(lambda1.*x))+(B*exp(lambda2.*x))-Sigma1;
phis2=(C*exp(lambda1.*(x-L1)))+(D*exp(lambda2.*(x-L1)))-Sigma2;
phi=phis1+phis2;
%X=x./L;
plot(x/(1e-6),phi,'Parent',axes5,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different tf');
end
%%
% Create figure(Surface Potential vs Channel Length for different tsi)
figure6 = figure;

% Create axes
axes6 = axes('Parent',figure6);
% Surface potential v/s Channel length plots
% Na = Acceptor Conc; Nd = Donor Conc; Ni = intrinsic Carrier Conc ; Eg =
% Bandgap; Persi = Permittivity of Si ; Perox = Pemittivity of Oxide.
K=1.38*10^-23; T=300; Ni=(1.5*10^10)*(1e-6); q=1.6*10^-19; Eg=1.12;
Persi=11.8*8.854*10^-14; Perox=3.9*8.85*10^-14;
Na=(6*10^16)*(1e-6); Nd=1*10^30;
tf=5*10^-9;tb=450*10^-9;
gamma=Persi/Perox;
Cb=Perox/tb;
Cf=Perox/tf;
%Terminal Potential
Vds=0.25;
Vgs=0.15; Vsub=0;
%phim=Metal Work Function
phim1=4.77; phim2=4.1;
%Calculation of values which will be same for two regions
%phit=thermal voltage;Vfb=Flat Band Voltage;phif=Fermi Potential;
phit=(K*T)/q;
phif=phit*log(Na/Ni);
phis=4.05+(Eg/2)+phif;
Vfb1=phim1-phis;
Vfb2=phim2-phis;
Vfbb=0;
Vbi=(Eg/2)+phit*log(Na/Ni);
Vg1=Vgs-Vfb1;
Vg2=Vgs-Vfb2;
Vsub2=Vsub-Vfbb;
%Specificatons of Diff. Parameters
L1=.15*10^-6; L2=.15*10^-6;
L=L1+L2;
x=0:.02*10^-6:L;
for tsi=500*10^-10:200*10^-10:1500*10^-10;
Csi=Persi/tsi;
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
lambda1=sqrt(Alpha);
lambda2=-lambda1;
Sigma1=Beta1/Alpha;
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
Sigma2=Beta2/Alpha;
A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(2*lambda2*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(lambda2*L1))-((Sigma1-Sigma2)/2);
phis1=(A*exp(lambda1.*x))+(B*exp(lambda2.*x))-Sigma1;
phis2=(C*exp(lambda1.*(x-L1)))+(D*exp(lambda2.*(x-L1)))-Sigma2;
phi=phis1-phis2;
plot(x,phi,'Parent',axes6,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
hold on;
xlabel('Channel Length');
ylabel('Surface Potential');
title('Surface Potential vs Channel Length for Different tsi');
end
%%
% Create figure(Electric Field vs Channel Length)
figure7 = figure;

% Create axes
axes7 = axes('Parent',figure7);
% Surface potential v/s Channel length plots
% Na = Acceptor Conc; Nd = Donor Conc; Ni = intrinsic Carrier Conc ; Eg =
% Bandgap; Persi = Permittivity of Si ; Perox = Pemittivity of Oxide.
K=1.38*10^-23; T=300; Ni=1.5*10^10*(1e-6); q=1.6*10^-19; Eg=1.12*1.6*10^-19;
Persi=11.8*8.854*10^-14; Perox=3.9*8.85*10^-14;
Na=6*10^22*(1e-6); Nd=1*10^30;
tf=5*10^-9; tb=450*10^-9; tsi=150*10^-9;
%Specificatons of Diff. Parameters
L1=.1*10^-6; L2=.3*10^-6;
L=L1+L2;
x1=0:.01e-6:L1;
x2=L1:0.01*10^-6:L1+L2;
X=[x1 x2];
%Terminal Potential
Vds=0.25;
Vgs=0.15; Vsub=0;
%phim=Metal Work Function
phim1=4.77; phim2=4.1;
%Calculation of values which will be same for two regions
%phit=thermal voltage;Vfb=Flat Band Voltage;phif=Fermi Potential;
phit=(K*T)/q;
phif=phit*log(Na/Ni);
phis=4.05+(Eg/2)+phif;
Vfb1=phim1-phis;
Vfb2=phim2-phis;
Vfbb=0;
Vbi=(Eg/2)+phit*log(Na/Ni);
Vg1=Vgs-Vfb1;
Vg2=Vgs-Vfb2;
Vsub2=Vsub-Vfbb;
gamma=Persi/Perox;
Cf=Perox/tf;
Cb=Perox/tb;
Csi=Persi/tsi;
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
lambda1=sqrt(Alpha);
lambda2=-lambda1;
Sigma1=Beta1/Alpha;
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*Vsub2)/(tsi^2*(1+(2*Csi)/Cb)));
Sigma2=Beta2/Alpha;
A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(2*lambda2*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(lambda2*L))/(1-exp(2*lambda2*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(lambda2*L1))-((Sigma1-Sigma2)/2);
phis1=(A*exp(lambda1.*x1))+(B*exp(lambda2.*x1))-Sigma1;
phis2=(C*exp(lambda1.*(x2-L1)))+(D*exp(lambda2.*(x2-L1)))-Sigma2;
E1=(A*lambda1*(exp(lambda1.*x1)))+(B*lambda2*(exp(lambda2.*x1)));
E2=(C*lambda1*(exp(lambda1.*(x2-L1))))+(D*lambda2*(exp(lambda2.*(x2-L1))));
E=[E1 E2];
plot(X,E,'Parent',axes7,'Color',[rand() rand() rand()],'LineWidth',1.5);
grid on;
xlabel('Channel Length');
ylabel('Electric Field');


