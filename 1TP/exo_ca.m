# Fonctions et tests de la partie C)a)
disp("Partie C)a)");

[x t] = ct_conv( @H, @H, [-5,5], 0.01); # On calcule la convolution
figure(1);
plotF = H(t); # Les valeurs de f à tracer
plotG = H(t); # Les valeurs de g à tracer
plot(t, plotF, 'r', t, plotG, 'g', t, x, 'b');
legend("f(t)", "g(t)", "f*g(t)");


  