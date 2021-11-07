% HW#10
%
% Simulate the pn junction band structure of Ge (Na and Nd are 10^16) at zero, forward and reverse bias. Simulate its current flow
% 
% simulation Variables 

Va = 0.0; % applied voltage is positive for forward bias, and negative for reverse bias

%%%%%%%%%%%%%% semiconductor (Ge) Variables %%%%%%%%%%%%%%%%%%%%%%%%

EA_semi = 4.0; % electron affinity
BG_semi = 0.66; % bandgap
perm_r=16.2; % dielectric constant
ni=2.4*10^13; % intrinsic carrier concentration (#/cm^3)
Na=10^16; % p-type hole doping concentration (unit:/cm^3)
Nd=10^16; % n-type electron doping concentration (unit:/cm^3)
Dn=101; % electron diffusion coefficient (cm^2/s)
Dp=49; % hole diffusion coefficient (cm^2/s)
Ln=0.3; % electron diffusion length (cm)
Lp=0.2; % hole diffusion length (cm)

%%%%%%%%%%%%%% constant variables %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

perm_a=8.85*10^-12; % absolute permittivity (F/cm)
q=1.6*10^-19; % electron charge (C)
kb=1.38064852*10^-23; % boltzmann constant (cm^2 kg s^-2 k^-1)
T= 300; % room temperature (K)

%%%%%%%%%%%%%% Simulation Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Built-in Junction Voltage, Vbi
Vbi = kb*T/q *log(Na*Nd/ni^2) - Va;

% Part on P-side, xp

xp = sqrt((2*perm_a*perm_r*Vbi/q)*(Nd/(Na*(Nd+Na)))); % p-type depletion layer width

% Part on N-side, xn

xn = sqrt((2*perm_a*perm_r*Vbi/q)*(Na/(Nd*(Na+Nd)))); % n-type depletion layer width

% Setting Parabolic Curvature 

x = (-500:500)*10^-6; % x range 

% Calculating V_xp where -xp ≤ x ≤ 0

V_xp = (q*Na/(2*perm_r*perm_a)*(x+xp).^2).*(x >= -xp & x < 0);

% Calculating V_xn where 0 ≤ x ≤ xn

V_xn = (q*Nd/(perm_a*perm_r)*(xn*x-x.^2/2)+q*Na/(2*perm_r*perm_a)*xp.^2).*(x >= 0 & x < xn)...
    + (q*Nd/(perm_a*perm_r)*(xn*xn-xn.^2/2)+q*Na/(2*perm_r*perm_a)*xp.^2).*(x>xn);

% Calculating V_total 

V_total = V_xp + V_xn;

% Voltage = Potential Energy / Positive Charge 

V_CB = - V_total - EA_semi;

V_VB = V_CB - BG_semi;

% Plot the Energy Band Diagrams 

plot(x,V_CB,x,V_VB);

axis([-inf,inf,min(V_VB)-0.3,max(V_CB)+0.3])

%%%%%%%%%%%%%% Current Calculation %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Va= -0.2:0.01:0.2;
J_sat = q*(Dn*Nd/Ln+Dp*Na/Lp);
J = J_sat*(exp(q*Va/(kb*T))-1);

area = 10^-2 * 10^-2; %current flow area 
I = J * area;

% Plot the Current Flow Diagram

figure(2)
plot(Va,I)

