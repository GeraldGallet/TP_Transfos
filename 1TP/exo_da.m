# Fonctions et tests de la partie D)a)
disp("Partie D)a)");

function[x] = Pe(t, e)
  x = (t >= -e/2) .* (t <= e/2);
end

function[x] = h(t)
  x = exp(-t.^2) .* sin(t./10);
end

for i = 0:0.3:3
  [x t] = pimp_my_ct_conv( @Pe, @h, [-3*pi,3*pi], 0.01, i);
  plotPE = Pe(t, i);
  plotH = h(t);
  plot(t, plotPE, 'r', t, plotH, 'g', t, x, 'b');
  legend("Pe(t)", "h(t)", "Pe*h(t)");
  hold on;
  %pause(1);
endfor  