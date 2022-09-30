
%Inverse element of multiplication group
%  a*a^{-1}=1
%  Example:
%  >> a = 5;
%  >> p = 7;
%  >> mulinv(a,p)
%  >> ans = 4
%
function out = mulinv(number, modulo)

  if (gcd(number,modulo)~= 1) 
  out = 'Inverse element does not exist';
  else 
    m=int64(number); n=int64(modulo);
    s=int64(1); t=int64(0);
    u=int64(0); v=int64(1);

    while n>0
      q=int64(floor((double(m))/double(n))); % Der Proportion wird abgerundet
      r=int64(m-q*n);
      m=n; n=r;
      tmp=u; u=s-q*u; s=tmp;
      tmp=v; v=t-q*v; t=tmp;
    end
    
    out = s;
    if(out < 0)
    out = modulo+out;
    end
  end
end