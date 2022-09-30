function rez = ssig_ver(p, g, r, s, b, m, hfun)
% Schnorr signature [r,s] verification on message m represented by string variable
% Public Parameters PP=(p,g)
% [r,s] - are two components of signature on message m
% a - is the public key for signature verification
% m - signed message represented by string type variable
% hfun - string variable representing h-functions used for signature generation
%        >> hfun='hd24' % decimal h-value computation of 24 bits length
%        >> hfun='hd28' % decimal h-value computation of 28 bits length
%
% Signature verification is TRUE if:
% 1. It was generated with the same PP.
% 2. It was signed with private key PrK=x corresponding to the public key PuK=a
% 3. Signature was generated on the same message m - integrity guarantee
% 4. Signature was generated with the same h-function: either 'hd24' or 'hd28'
%
% Example:
% >> p=int64(268435019)
% p = 268435019
% >> g=2
% g = 2
% r = .....
% s = .....
% a = 202796965
% >> m='Hello Bob! How are you?'
% m = Hello Bob! How are you?
% >> hfun='hd28'
% hfun = hd28
%
    max = int64(9223372036854775807);
    g_s = mod_exp(g,s,p);
    c = strcat(num2str(m),num2str(r));    
    switch (hfun)
      case 'hd24'
        c = hd24(c);
      case 'hd26'
        c = hd26(c);
      case 'hd28'
        c = hd28(c);
     otherwise
       disp('Wrong H-function. Possible inputs: hd24,hd26,hd28')
       rez = 'NaN';
       return;
    endswitch
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
      rez = strcat("TRUE: Signature correct\nVal=\t", num2str(g_s));
    else
      rez = strcat(
      strcat("FALSE: Signature incorrect\n\tLeftSide(g^s) = \t\t" , num2str(g_s))
      , strcat("\n\tRight_side (r*b^c mod p) = \t", num2str(rb_c)));
    endif
