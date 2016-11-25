function[x] = Qe(t, e)
  x =  Pe(t-e, e) - Pe(t+e, e);
end