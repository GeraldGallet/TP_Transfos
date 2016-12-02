function[n] = exo_3()
  theta = 0.2;
  T = 1;
  N = 8; % les termes de la série de Fourier iront de -N à N
  
  tMin = -3*T;
  tMax = 5*T;
  nSteps = 2^14+1; % nb d'échantillons
  t = linspace(tMin, tMax, nSteps);
  x = sq(theta, T, t)/theta;
  
  figure(1);
  hold on, grid on;
  axis([tMin tMax -1 2]);
  plot(t, x);
  
  f = -N/T:1/T:N/T;
  spectrum = theta*sinc(f*T*theta);
  figure(2);
  hold on, grid on;
  stem(f, spectrum, 'r');
  
  fFast = -N/T:1/(4*T):N/T;
  enveloppe = theta * sinc(fFast*T*theta);
  plot(fFast, enveloppe, 'k');
  
  xFourier = zeros(size(t));
  for n = -N:N
    cn = spectrum(N+1-n);
    xFourier += cn * exp(2*j*pi*n/T*t);
  endfor
  figure(1);
  plot(t, real(xFourier), "r");  
  
end