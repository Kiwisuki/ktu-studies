function rez = sig_ver(p, g, r, s, a, h)
% Schnorr signature's [r,s] on the message h verification is performed
% with Puk=a using the same PP=[p,g] as it was generated
% h is a signed h-value obtained by concatenation m and r (first m second r)
% >> sig_ver(p,g,r,s,b,h)

    
    max = int64(9223372036854775807);
    
    
    g_s = mod_exp(g,s,p);
    b_c = mod_exp(b,c,p);
    
    if(g_s >= max) 
      error("Out of memory: Number overflow error");
    endif 
    if(b_c >= max) 
      error("Out of memory: Number overflow error");
    endif 
    if(r * b_c >= max) 
      error("Out of memory: Number overflow error");
    endif 
    rb_c=mod(r*b_c,p);
    
    if (g_s == rb_c)
      rez = strcat("TRUE: Signature correct\n\tVal=\t", num2str(g_s));
    else
      rez = strcat(
      strcat("FALSE: Signature incorrect\n\tLeftSide(g^s) = \t\t" , num2str(g_s))
      , strcat("\n\tRight_side (r*b^c mod p) = \t", num2str(rb_c)));
    endif