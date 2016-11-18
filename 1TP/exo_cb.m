# Fonctions et tests de la partie C)b)
disp("Partie C)b)");

function[x] = P(t)
  x = (t >= -1/2) .* (t <= 1/2);
end

function[x] = Q(t)
  x = (t >= -1) .* (t <= 1); 
end

[x t] = ct_conv( @P, @Q, [-2,2], 0.01);
figure(2);
title("Exercice C) b)");
plotP = P(t);
plotQ = Q(t);
plot(t, plotP, 'r', t, plotQ, 'g', t, x, 'b');
legend("P(t)", "Q(t)", "P*Q(t)");