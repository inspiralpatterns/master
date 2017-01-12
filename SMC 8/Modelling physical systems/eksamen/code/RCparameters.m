%%                     MOOG 904B HIGH PASS FILTER
%
%          *** DYNAMIC RESISTANCE AND CUT-OFF FREQUENCY ***   
%
% It implements the Ebers-Moll BJT model equations, following this book:
% Jaeger, Richard C., and Travis N. Blalock. Microelectronic circuit design. 
% Vol. 97. New York: McGraw-Hill, 1997.
%
% Author:   Diego Di Carlo, Mattia Paterna
% Date:     07 June 2016
% AAU-CPH/SMC8/MSP 2016

clc; clear; close all;

%% Constant
E = -0.100:0.001:0.100; % differential mode control signal
E_BIAS = 0.550;         % common mode control signal
C_EQ_LOW = 3.1609E-9;   % Equivalent capacitor in low range
C_EQ_HIGH = C_EQ_LOW/2; % Equivalent capacitor in high range

% Transistor physical parameter
% npn 2n3392 
npn.I_SAT = 12.03E-15;
npn.V_BE = E + E_BIAS;
npn.V_THERM = 26E-3;
npn.V_CE = 11.9878;
npn.V_EARLY = 37.37;
npn.Rout = 0;

npn.R_CC = 22E3;

% pnp 2n4058
pnp.I_SAT = 6.734E-15;
pnp.V_BE = (E + E_BIAS);
pnp.V_THERM = 26E-3;
pnp.V_CE = 6;
pnp.V_EARLY = 45.7;
pnp.Rout = 0;

pnp.R_CC = 1E3;

%% Dynamic output resistance computation

npn.Ic = 3*npn.I_SAT * exp(npn.V_BE/npn.V_THERM) * (1 + npn.V_CE/npn.V_EARLY);
npn.Rout =  1./( npn.Ic / (npn.V_EARLY + npn.V_CE));
npn.Req = npn.Rout + npn.R_CC;

pnp.Ic = (3*pnp.I_SAT * exp(pnp.V_BE/pnp.V_THERM) * (1 + pnp.V_CE/pnp.V_EARLY));
pnp.Rout =  1./( pnp.Ic / (pnp.V_EARLY + pnp.V_CE));
pnp.Req = pnp.Rout + pnp.R_CC;

% equivalent resistor (parallel)
Req = (pnp.Req .* npn.Req)./(pnp.Req + npn.Req);

%% Cut-off frequency computation

wCutoffLOW = 1./(C_EQ_LOW*Req);             % [rad/s]
wCutoffHIGH = 1./(C_EQ_HIGH*Req);

fCutoffLOW = 1./(2*pi*(C_EQ_LOW*Req));      % [Hz]
fCutoffHIGH = 1./(2*pi*(C_EQ_HIGH*Req));

%% Results
figure(1)
plot(E, npn.Req)
hold on
plot(E, pnp.Req)
plot(E, Req)
hold off
title('Diodes dynamic resI_SATtances as function of the control signal E');
xlabel('E (Volt)'); ylabel('f_c (Hz)');
legend('NPN dynamic resI_SATtance', 'PNP dynamic resI_SATtance', 'Parallel ResI_SATtance');


figure(2)
subplot(2,1,1)
plot(npn.V_BE,fCutoffLOW);
hold on
plot(npn.V_BE,fCutoffHIGH);
hold off
set(gca,'ygrid','on')
title('Cut-off frequency as function of the control signal E in linear scale');
xlabel('E (Volt)'); ylabel('f_c (Hz)');
legend('Low range frequency', 'High range frequency');

subplot(2,1,2)
semilogy(npn.V_BE,fCutoffLOW);
hold on
semilogy(npn.V_BE,fCutoffHIGH);
hold off
set(gca,'ygrid','on')
title('Cut-off frequency as function of the control signal E in log scale');
xlabel('E (Volt)'); ylabel('f_c (Hz)');
legend('Low range frequency', 'High range frequency');


