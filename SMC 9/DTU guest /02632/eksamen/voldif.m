function Vd = voldif(R, n)

% volume of a hypersphere
Vs = (pi^(n/2)/(gamma(n/2+1)))*(R^n);

% volume of hypercube
Vc = (2*R)^n;

Vd = Vc - Vs;

end