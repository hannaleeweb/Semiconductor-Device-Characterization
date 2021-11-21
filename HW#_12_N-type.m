% HW12 
%
% 1-2. Simulate the band structure of various metal / Si (1. Na: 10^15 and 2. Nd 10^15) and its current flow 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% bias %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Va=0.5; % drain voltage

%%%%%%%%%%%%%%%% electrode %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
WF_metal = 4.5; % drain metal work function

% WF_metal = 4.5; Chromium
% WF_metal = 4.6; Molybdenum
% WF_metal = 4.28; Aluminum
% WF_metal = 4.33; Titanium

%%%%%%%%%%%%%%%% semiconductor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
EA_semi = 4.05; % electron affinity
BG_semi = 1.12; % bandgap
perm_r=11.9; % dielectric constant
ni=10^10;
Na=0; % hole doping concentration (unit:C/m^3)
Nd=10^15; % electron doping concentration (unit:C/m^3)
me = 1.09;
mh = 1.15;
m0 = 9.10938356 * 10^-31;

%%%%%%%%%%%%%%%% constant variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
perm_a=8.85*10^-14; % absolute permittivity (F/cm)
q=1.6*10^-19; %electron charge (C)
kb=1.38064852*10^-23; %boltzmann constant (m^2 kg s^-2 k^-1)
T= 300; % room temperature (K)
h= 6.62607004 * 10^-34; %planck constant (m^2 kg/s)

%%%%%%%%%%%%%% Simulation Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

WF_semi = EA_semi + BG_semi/2 - ((kb*T)/(q*log(Nd/ni))); % n-type semi Ei + offsetp;

% Only for 
% WF_metal > WF_semi in n-type
% WF_metal < WF_semi in p-type

Vbi = (WF_metal - WF_semi) + Va;

% Schottky barrier for electron flow from metal to Semiconductor
SB = (WF_metal-EA_semi); % n-type semi

W = sqrt(2*perm_a*perm_r*Vbi/(q*Nd)); % depletion layer width ntype;

% Setting Parabolic Curvature;
x = (-500:500)*10^-6;

V= (q*Nd/(perm_a*perm_r)*(W*x-x.^2/2)).*(x>=0 & x<W) + (q*Nd/(perm_a*perm_r)*(W*W-W.^2/2)).*(x>W); % n-type

% Calculating V_CB and V_VB;

V_CB = -SB.*(x<0)-V.*(x>=0);
V_VB = -SB.*(x<0)-(V + BG_semi).*(x>=0);

% Plotting ;

plot(x,V_CB,x,V_VB);
axis([-inf,inf,min(V_VB)-0.3,max(V_CB)+0.3]);


%%%%%%%%%%%%%% Current Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = 4*pi*q*m0*me*kb^2/h^3*10^-4; % richardson constant (*10^-4 for cm scale)
Vds = -0.2:0.01:0.2;
me = 1.09;
mh = 1.15;
m0 = 9.10938356 * 10^-31;
meff_e = m0 * me;
meff_h = m0 * mh;

B = q.*(WF_metal-EA_semi);

C = (exp(-q*B/(kb*T)));

D = (exp(q*Vds/(kb*T))-1);

J = A*T^2*C*D;

% Plot the Current Flow Diagram

figure(2)
plot(Vds,J)
