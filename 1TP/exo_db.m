# Fonctions et tests de la partie D)b)
disp("Partie D)b)");

for i = 0.01:0.01
  [x t] = ct_conv_perso( @Qe, @h, [-0.5,0.5], 0.01, i);
  plotQE = Qe(t, i);
  plotPE = Pe(t, i);
  plotH = h(t);
  plot(t, plotQE, 'r', t, plotH, 'g', t, x, 'b');
  legend("Qe(t)", "h(t)", "Qe*h(t)");
  hold on;
  pause(1);
endfor  