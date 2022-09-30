function a=eeuklid(a,b)
% [gcd, x, y]=eeuklid(a, b) :
%
%      a*x + b*y = gcd(a, b)
 
% http://www.schlauweb.de/Erweiterter_euklidischer_Algorithmus, 2008.09.22


m=int64(a); n=int64(b);
s=int64(1); t=int64(0);
u=int64(0); v=int64(1);

while n>0
  q=int64(floor((double(m))/double(n))); % Der Proportion wird abgerundet
  r=int64(m-q*n);
  m=n; n=r;
  tmp=u; u=s-q*u; s=tmp;
  tmp=v; v=t-q*v; t=tmp;
end

a=[m,s,t];
