function[n] = exo_2()
  % Conditions de départ
  theta = 0.2;
  T = 1;
  N = 8;
  
  % Calcul du signal x
  tMin = -3*T;
  tMax = 5*T;
  nSteps = 2^14+1;
  t = linspace(tMin, tMax, nSteps);
  x = sq(theta, T, t);
  
  % Calcul du spectre de fréquence
  f = -N/T:1/T:N/T;
  spectrum = theta*sinc(f*T*theta);  
  fFast = -N/T:1/(4*T):N/T;
  enveloppe = theta * sinc(fFast*T*theta);
  
  % Calcul de son enveloppe
  xFourier = zeros(size(t));
  for n = -N:N
    cn = spectrum(N+1-n);
    xFourier += cn * exp(2*j*pi*n/T*t);
  endfor
  
  % Les tracés en temporel
  figure(1);
  hold on, grid on;
  axis([tMin tMax -1 2]);
  plot(t, x);
  plot(t, real(xFourier), "r"); 
 
  % Les tracés en fréquentiel
  figure(2);
  hold on, grid on;
  stem(f, spectrum, 'r'); 
  plot(fFast, enveloppe, 'k');
  
end