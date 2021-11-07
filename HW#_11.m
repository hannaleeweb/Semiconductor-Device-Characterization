% HW#11
%
% Simulate the band structure of Ge(Na 10^16) / Si(Nd 10^16)
% 1. At Va=0, negative, positive
% 2. Check the band change at different doping concentrations
% 3. Simulate current flow
% 
% Simulation Variables 

Va = -0.3; % applied voltage is positive for forward bias, and negative for reverse bias

%%%%%%%%%%%%%%%% semiconductor_left (Si)_p doping %%%%%%%%%%%%%
EA_l = 4.05; % electron affinity
BG_l = 1.12; % bandgap
perm_r_l=11.9; % dielectric constant
ni_l=10^10; % intrinsic carrier concentration (#/cm^3)
Na_l=10^16; % hole doping concentration (unit:C/m^3)
Nd_l=0; % electron doping concentration (unit:C/m^3)
Dn_l=36; % electron diffusion coefficient (cm^2/s)
Dp_l=12; % hole diffusion coefficient (cm^2/s)
Ln_l=0.04; % electron diffusion length (cm)
Lp_l=0.024; % hole diffusion length (cm)

%%%%%%%%%%%%%%%% semiconductor_right (Ge)_n doping %%%%%%%%%%%%%
EA_r = 4.0; % electron affinity
BG_r = 0.66; % bandgap
perm_r_r=16.2; % dielectric constant
ni_r=2.4*10^13; % intrinsic carrier concentration (#/cm^3)
Na_r=0; % hole doping concentration (unit:C/m^3)
Nd_r=10^16; % electron doping concentration (unit:C/m^3)
Dn_r=100; % electron diffusion coefficient (cm^2/s)
Dp_r=50; % hole diffusion coefficient (cm^2/s)
Ln_r=0.3; % electron diffusion length (cm)
Lp_r=0.15; % hole diffusion length (cm)

%%%%%%%%%%%%%%%% constant variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
perm_a=8.85*10^-12; % absolute permittivity (F/m)
q=1.6*10^-19; %electron charge (C)
kb=1.38064852*10^-23; % boltzmann constant
T= 300; % room temperature (K)

%%%%%%%%%%%%%% Simulation Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%

% Built-in Junction Voltage, Vbi = Delta Fermi Level
WF_l = EA_l + BG_l/2 + kb*T/q *log(Na_l/ni_l) - Va;
WF_r = EA_r + BG_r/2 + kb*T/q *log(Nd_r/ni_r) - Va;

Vbi = WF_l + WF_r + Va;

% Part on P-side, xp

xp = sqrt((2*perm_a*perm_r_l*Vbi/q)*(Nd_l/(Na_l*(Nd_l+Na_l)))); % p-type depletion layer width

% Part on N-side, xn

xn = sqrt((2*perm_a*perm_r_r*Vbi/q)*(Na_r/(Nd_r*(Na_r+Nd_r)))); % n-type depletion layer width

% Setting Parabolic Curvature 

x = (-500:500)*10^-6; % x range 

Delta_EA = EA_l-EA_r;
Delta_EAnEG = (EA_l+BG_l)-(EA_r+BG_r);

% Calculating V_xp_CB where -xp ≤ x ≤ 0

V_xp_CB = 0.*(x<xp) + (q*Na_l/(2*perm_r_l*perm_a)*(x+xp).^2).*(x >= -xp & x < 0);

% Calculating V_xn_CB where 0 ≤ x ≤ xn

V_xn_CB = (q*Nd_r/(perm_a*perm_r_r)*(xn*x-x.^2/2)+q*Na_r/(2*perm_r_r*perm_a)*xp.^2).*(x >= 0 & x < xn)...
    + (q*Nd_r/(perm_a*perm_r_r)*(xn*xn-xn.^2/2)+q*Na_r/(2*perm_r_r*perm_a)*xp.^2).*(x>xn) + Delta_EA;

% Calculating V_xp_VB where -xp ≤ x ≤ 0

V_xp_VB = 0.*(x<xp) + (q*Na_l/(2*perm_r_l*perm_a)*(x+xp).^2).*(x >= -xp & x < 0);

% Calculating V_xn_VB where 0 ≤ x ≤ xn

V_xn_VB = (q*Nd_r/(perm_a*perm_r_r)*(xn*x-x.^2/2)+q*Na_r/(2*perm_r_r*perm_a)*xp.^2).*(x >= 0 & x < xn)
    + (q*Nd_r/(perm_a*perm_r_r)*(xn*xn-xn.^2/2)+q*Na_r/(2*perm_r_r*perm_a)*xp.^2).*(x>xn) + Delta_EAnEG;

% Calculating V_total_CB 

V_total_CB = V_xp_CB + V_xn_CB;

% Calculating V_total_VB

V_total_VB = V_xp_VB + V_xn_VB;

% Voltage = Potential Energy / Positive Charge 

V_CB = - V_total_CB; % conduction band 

V_VB = V_total_VB - BG_l; % valence band

% Plot the Energy Band Diagrams 

plot(x,V_CB,x,V_VB);

axis([-inf,inf,min(V_VB)-0.3,max(V_CB)+0.3])

%%%%%%%%%%%%%% Current Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Va= -0.2:0.01:0.2;
J_sat = (q*Dn_l*ni_l^2/Ln_l*Na_l)+(q*Dn_r*ni_r^2/Ln_r*Na_r)
J = J_sat*(exp(q*Va/(kb*T))-1);

area = 10^-2 * 10^-2; %current flow area 
I = J * area;

% Plot the Current Flow Diagram

figure(2)
plot(Va,I)

