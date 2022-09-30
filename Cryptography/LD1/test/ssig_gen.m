function [r, s] = ssig_gen(p, g, x, m, hfun)
% Schnorr signature generation on message m represented by string type variable
% Public Parameters PP=(p,g)
% x - private key (PrK)
% m - message to be signed represented by string type variable
% hfun - string variable representing h-functions used for signature generation
%        >> hfun='hd24' % decimal h-value computation of 24 bits length
%        >> hfun='hd28' % decimal h-value computation of 28 bits length
% Returned values are [r,s]
%
% Example:
% >> p=int64(268435019)
% p = 268435019
% >> g=2
% g = 2
% >>x=int64(randi(p-1))
% x = 133184322
% >> a=mod_exp(g,x,p)
% a = 202796965
% >> m='Hello Bob! How are you?'
% m = Hello Bob! How are you?
% >> hfun='hd28'
% hfun = hd28
%
% >> [r,s]=ssig_gen(p, g, x, m, 'hd28')
%
  zz=randi(p-1);
  r=mod_exp(g,zz,p);
  m = strcat(num2str(m),num2str(r)); 
  switch (hfun)
    case 'hd24'
      m = hd24(m);
    case 'hd26'
      m = hd26(m);
    case 'hd28'
      m = hd28(m);
   otherwise
     disp('Wrong H-function. Possible inputs: hd24,hd26,hd28')
     s = 'NaN';
     return;
  endswitch
  
  s_1 = mod(x*m,p-1);
  s=mod(zz+s_1,p-1);

endfunction
