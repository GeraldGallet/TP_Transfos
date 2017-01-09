function h = heaviside(t)

% function h = heaviside(t)
%
% Returns 0 if t<0 and 1 if t>=0
%
% B. Parent 2013-11-28

h = 0.5 * (1 + sign(t));
indices = find( abs(t)<eps );
h(indices) = ones(size(indices));
