function[x] = h(t)
  x = exp(-t.^2) .* sin(t./10);
end