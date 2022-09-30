function [r, s] = sig_gen(p, g, x, m)
% Schnorr signature generation on decimally encoded message m<p
% Public Parameters PP=(p,g)
% PrK=x
% Returned values are [r,s]
% >> [r,s]=sig_gen(p, g, a, m)
zz=randi(p);  
  r=mod_exp(g,zz,p);
  s_1 = mod(x*m,p-1);
  s=mod(zz+s_1,p-1);
  
endfunction
