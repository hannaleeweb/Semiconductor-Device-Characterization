% HW# 13 
% 
% 1~2. Simulate the band structure of any metal / SiO2 / Si (1. Na 10^15, 2. Nd 10^15) 
% and band structure under positive, negative gate voltage.
%
% 3. Current flow of 1~2.
%
%%%%%%%%%%%%%%%% bias %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
V_gate=-2.3; % gate voltage

%%%%%%%%%%%%%%%% electrode %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WF_G_metal = 4.5; % drain metal work function

% Chromium (Cr) WF_G_metal = 4.5 

%%%%%%%%%%%%%%%% semiconductor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EA_semi = 4.05; % electron affinity
BG_semi = 1.12; % bandgap
perm_r=11.7; % dielectric constant
ni=10^10;
Na=10^15; % hole doping concentration (unit:C/cm^3)
Nd=0; % electron doping concentration (unit:C/cm^3)
me = 1.09;
mh = 1.15;
m0 = 9.10938356 * 10^-31;

%%%%%%%%%%%%%%%% SiO2 insulator %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EA_ins = 0.9; % electron affinity
BG_ins = 9.0; % bandgap
perm_ins=3.9; %insulator dielectric constant
thick_ins=50*10^-7; %insulator thickness (cm)

%%%%%%%%%%%%%%%% constant variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
perm_a=8.85*10^-14; % absolute permittivity (F/cm)
q=1.6*10^-19; %electron charge (C)
kb=1.38064852*10^-23; %boltzmann constant (m^2 kg s^-2 k^-1)
T= 300; % room temperature (K)
h= 6.62607004 * 10^-34; %planck constant (m^2 kg/s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Simulation Calculation 

% V-offset in p-type semi
V_offset=kb*T/q * log(Na/ni); 

% p-type work function of semiconductor, p-type
WF_semi = EA_semi + BG_semi/2 +V_offset; 

% Built-in potential through insulator
Vbi_mos = WF_G_metal-WF_semi - V_gate;

% Metal / Oxide / Semi capacitor charge 
Q = (perm_a*perm_r*(Vbi_mos))/thick_ins;

% Depletion layer width of semi, p-type 
W = sqrt(2*perm_a*perm_r*Vbi_mos/(q*Na)); 

% Setting Parabolic Curvature;
x_scale =10^-7;
x = (-800:500)*x_scale;

V = (q*Na/(perm_a*perm_r)*(-W*x+x.^2/2)).*(x>=0 & x<W) + (q*Na/(perm_a*perm_r)*(-W*W+W.^2/2)).*(x>W); % p-type; 

% Calculating V_CB and V_VB;
V_CB = (Vbi_mos).*(x<-400*x_scale) + (((Vbi_mos)/(-400*x_scale))*x-(EA_ins-EA_semi)).*(x>=-400*x_scale&x<=0*x_scale) + (-V).*(x>0);

V_VB = (Vbi_mos).*(x<-400*x_scale) + (V_CB -BG_ins).*(x>=-400*x_scale&x<=0*x_scale) + (V_CB - BG_semi).*(x>0);

% Plotting ;
figure(1)
plot(x,V_CB,x,V_VB);
axis([-inf,inf,min(V_VB)-0.3,max(V_CB)+0.3])

% Calculating maximum depletion layer width of semi, p-type 
W_max=sqrt((2*perm_a*perm_r*abs(2*V_offset)/(q*Na)));

if W > W_max
W=W_max;
end

%%%%%%%%%%%%%% Current Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Vds = 0:0.01:2;
W = 1*10^-4;
L = 1*10^-4;
V_th = 0.7 ; % typical Threshold voltage for n-type, V
A = 200*10^-6 ; % uCox 

for i=1:10
     Vgs = i/5;
     Vds_sat = Vgs-V_th;
     if Vds_sat < 0
         continue;
     end 

     Lds(i,:) = (((A*W/L).*(((Vgs-V_th).*Vds)-((1/2).*Vds.^2))).*(Vds<Vds_sat)) + ((A*W/(2*L))*(Vds_sat)^2)*(Vds>=Vds_sat);

end

% Plot the Current Flow Diagram
figure(2)
plot(Vds, Lds)
