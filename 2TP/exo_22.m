function[n] = exo_22()
  p = tf("p");
  sys = 1/(p^2 + 0.6*p + 1);
  Tend = 60;
  NbPoints = 3000;
  t = linspace(0, Tend, NbPoints);
  
  for omega = 0.1:0.1:0.1
    x = sin(omega .* t);
    lsim(sys, x);
    hold on;
    pause(1);
  endfor
end