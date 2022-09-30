function y = mod_exp_f(p,g,n)
  y=zeros(0,n);
  for i=1:n
    j=i-1;
    y(i)=mod_exp(g,j,p);
  endfor
end