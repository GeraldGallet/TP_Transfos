function[n] = exo_11() # Exo I/ 1)
  p = tf("p");
  sys = (10*(5*p+1))/(p^3 + 1.1*p^2 + 42.1*p + 4);

  Tend = 20;
  NbPoints = 1000;
  t = linspace(0, Tend, NbPoints);
  step(sys, t);

  input = 1/p;
  output = sys * input;

  outputNumer = get(output, "num"){1}
  outputDeter = get(output, "den"){1}
  [R, P, K, E] = residue(outputNumer, outputDeter);

  y = zeros(size(t));
  for i = 1:length(R)
    y = y + R(i) * t.^(E(i) - 1) / factorial(E(i)-1) .* exp(t*P(i));
  endfor  

  pause(3);
  hold on;
  plot(t, real(y), 'r');
  
  disp("Les poles sont : ");
  P
end