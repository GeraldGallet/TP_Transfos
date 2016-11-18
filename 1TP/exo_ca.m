# Fonctions et tests de la partie C)a)
disp("Partie C)a)");

function[x] = H(t)
  x = t >= 0;
end

function[x] = f(t)
  x = 2*H(t) .* exp(-t);
end

function[x] = g(t)
  x = 3 * exp(-4*(t - 1).^2) + 2 * exp(-2*(t - 2.5).^2);
end  

[x t] = ct_conv( @f, @g, [0,10], 0.01);
figure(1);
title("Exercice C) a)");
plotF = f(t);
plotG = g(t);
plot(t, plotF, 'r', t, plotG, 'g', t, x, 'b');
legend("f(t)", "g(t)", "f*g(t)");


  