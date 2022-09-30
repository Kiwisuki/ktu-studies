function el=ElG_s(p,g,x,k,m)
%p -pirminis, g-generatorius,x-laisvai pasirenkamas,k-laisvai pasirenkamas,
%m-pranesðimo h(t) funkcija atvaizduota i skaiciu

  if ~isprime(p) % tikrinimas ar p yra piminis
    disp('p nera pirminis skaicius');
    return;
  end;
  
  if ~((x >= 2) && x <= (p-2) ) % tikrinimas x patenka i intervala [2;p-2]
    disp('x nepatenka i intervala [2;p-2]');
    return; 
  end;
  
  if ~eq(gcd(p,g),1) % tikrinimas ar p yra piminis
    disp('p nera stiprus pirminis');
    return;
  end;
  
  q=(p-1)/2; % tikrinimas ar g yra generatorius
  g1=mod_exp(g,q,p);
  g2=mod_exp(g,2,p);
  if (eq(g1,1) || eq(g2,1))
    disp('g nera generatorius');
    return;
  end;
  
  if ~((k >= 1) && k <= (p-2) ) % tikrinimas k patenka i intervala [1;p-2]
    disp('k nepatenka i intervala [1;p-2]');
    return; 
  end;
  
  if ~eq(gcd(k,p-1),1) % tikrinimas ar k ir p-1 yra realiatyviai pirminiai
    disp('k ir p-1 nera realiatyviai pirminiai');
    return;
  end;
  
  if ~((m >= 0) && m <= (p-1) ) % santraukos funkcija m atvaizduota i sveikaji skaiciu is intervalo [0;p-1]
    disp('santraukos funkcija m atvaizduota ne i sveikaji skaiciu is intervalo [0;p-1]');
    return; 
  end;

  a=mod_exp(g,x,p);
  VRa=a;%viesasis raktas
  VRp=x;%privatusis raktas

  r=mod_exp(g,k,p);
  k_atv=modInv(k,p-1); %k atvirkstininis moduliu p-1

  s=mod(k_atv*m,p-1)-mod(k_atv*x*r,p-1);

  if eq(s,0) % tikrinimas ar s lygu nuliui 
  disp('s=0, pasirinkite kita k');
  return;
  end;

  %rakto tikrinimui
  v1=mod(mod_exp(a,r,p)*mod_exp(r,s,p),p);
  v2=mod_exp(g,m,p);
      
      
  if v1==v2
    disp('geras parasas:');
    el=[r, s];%grazinamas e parasaS, kuris yra skaiciu pora (r,s)
    el;
    return; 
  else
    disp('klaidingas parasas');
    return; 
  end;
  
end;