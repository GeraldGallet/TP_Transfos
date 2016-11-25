function[x] = Pe(t, e)
  x = (t >= -e/2) .* (t <= e/2);
end