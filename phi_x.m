function [phis]= phi_x(Na,tf,tsi,L1,L2,Vds,phim1,phim2)
%###SURFACE POTENTIAL
K=1.38*10^-23; T=300; 
q=1.6*10^-19; % electronic change
Eg=1.12; %Bandgap (in eV)
Persi=11.9*8.854*10^-14; %Si permitivity
Perox=3.9*8.85*10^-14; %SiO2 permitivity
% % Na=1e21; %$$$$$$ Body doping(Acceptor) Doping concentration 
Nd=5e27; %$$$$ Source/Drain  concentration
Ni=(1.5e10)*(1e-6); % intrinsic Carrier Conc
%########STRUCTURAL PARAMETERS###############
% % tf=2e-9; %$$$$$ front oxide thickness 5e-9
tb=2e-9; %$$$$ back oxide thickness 50e9
% % tsi=5e-9; %$$$$ thin film thickness 150e-9
% % L1=10e-9; %$$$$$$ Channel length under gate M1
% % L2=10e-9; %$$$$$$$ Channel length under gate M2
L=L1+L2; %Total channel length
%#########BIAS VOLTAGES##############
Vgs=0.35;
% % Vds=0.3;
Vsub=0;
Vdd=1.8;
%########################
%Metal Work Function(in eV)
% % phim1=5.25;%$$$$$$$ Work funcction of M1 4.77
% % phim2=4.17;%$$$$$$$ Work funcction of M2 4.1
phit=(K*T)/q; %Thermal voltage
phif=phit*log(Na/Ni);  %p type substrate Fermi Potential
phis=4.05+(Eg/2)+phif; %p type substrate-Work_function
Vfb1=phim1-phis; %Flatband voltage under gate M1
Vfb2=phim2-phis; %Flatband voltage under gate M2
VfBb=Vfb2;%Back gate Flatband voltage
%#######################
Vg1=Vgs-Vfb1;% Vg1' 
Vg2=Vgs-Vfb2;% Vg2'
VGSb=Vgs-VfBb;% VGSb'
Vbi=(Eg/2)+phit*log((Na)/(Ni)); %In built potential across body source junction
Cb=Perox/tb; %Back oxide capacitance
Cf=Perox/tf; %Front oxide capacitance
Csi=Persi/tsi; %Thin film capacitance
Alpha=(2*(1+(Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb));
Beta1=((q*Na)/Persi)-((2*Vg1*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*VGSb)/((tsi^2)*(1+(2*Csi)/Cb)));
Beta2=((q*Na)/Persi)-((2*Vg2*((Cf/Cb)+(Cf/Csi)))/((tsi^2)*(1+(2*Csi)/Cb)))-((2*VGSb)/((tsi^2)*(1+(2*Csi)/Cb)));
Sigma1=Beta1/Alpha;
Sigma2=Beta2/Alpha;
lambda1=sqrt(Alpha); % lambda1=eta 
lambda2=-lambda1; % lambda2=-eta

A=(Vbi+Sigma2+Vds)-(Vbi+Sigma1)*exp(-lambda1*L)+((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(-lambda1*L))/(1-exp(-2*lambda1*L));
B=(((Vbi+Sigma1)-(Vbi+Sigma2+Vds)*exp(-lambda1*L))/(1-exp(-2*lambda1*L)))-(((Sigma1-Sigma2)*cosh(lambda1*L2)*exp(-lambda1*L))/(1-exp(-2*lambda1*L)));
C=(A*exp(lambda1*L1))-((Sigma1-Sigma2)/2);
D=(B*exp(-lambda1*L1))-((Sigma1-Sigma2)/2);
%##########################################
x=0:.01e-9:L; 
phis1=(A*exp(lambda1*x))+(B*exp(lambda2*x))-Sigma1;
phis2=(C*exp(lambda1*(x-L1)))+(D*exp(lambda2*(x-L1)))-Sigma2;
phis=phis1+phis2;