# Fonctions et tests de la partie D)b)
disp("Partie D)b)");

function[x] = Qe(t, e)
  x =  Pe(t-e, e) - Pe(t+e, e);
end

function[x] = h(t)
  x = exp(-t.^2) .* sin(t./10);
end

for i = 2:2
  [x t] = pimp_my_ct_conv( @Qe, @h, [-3*pi,3*pi], 0.01, i);
  plotQE = Qe(t, i);
  plotPE = Pe(t, i);
  plotH = h(t);
  plot(t, plotQE, 'r', t, plotH, 'g', t, x, 'b');
  legend("Qe(t)", "h(t)", "Qe*h(t)");
  hold on;
endfor  