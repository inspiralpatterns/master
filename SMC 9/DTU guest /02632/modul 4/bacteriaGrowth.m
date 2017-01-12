%% module 4 assignments
%
% Bacteria growth

function [tN] = bacteriaGrowth(n0,alpha,K,N)
% bacteriaGrowth: simulates the bacteria growth hour by hour and stops when
% number of bacteria exceeds a fixed number N
%   I/O
%   n0: bacteria initial number (scalar)
%   alpha: growth rate (scalar)
%   K: capacity (scalar)
%   N: final population size (scalar, n0<N<K)
%
%   tN: time t at which population exceeds N (scalar)

% initialize counter
tN = 0;

while (n0 < N)
    tN = tN + 1;
    n = (1 + alpha * (1 - n0/K))*n0;
    
    % disp(n);
    
    % break statement - not necessary here
    if n > N
        break;
    end
    n0 = n; % not necessary, it can be possible using the same variable
end

