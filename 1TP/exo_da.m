# Fonctions et tests de la partie D)a)
disp("Partie D)a)");

for i = 0:3:9
  [x t] = ct_conv_perso( @Pe, @h, [-3*pi,3*pi], 0.01, i);
  plotPE = Pe(t, i);
  plotH = h(t);
  plot(t, plotPE, 'r', t, plotH, 'g', t, x, 'b');
  legend("Pe(t)", "h(t)", "Pe*h(t)");
  hold on;
  pause(1);
endfor  