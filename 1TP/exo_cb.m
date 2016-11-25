# Fonctions et tests de la partie C)b)
disp("Partie C)b)");
[x t] = ct_conv( @P, @Q, [-2,2], 0.01); # On calcule la convolution
figure(2);
plotP = P(t); # Les valeurs de P à tracer
plotQ = Q(t); # Les valeurs de Q à tracer
plot(t, plotP, 'r', t, plotQ, 'g', t, x, 'b');
legend("P(t)", "Q(t)", "P*Q(t)");