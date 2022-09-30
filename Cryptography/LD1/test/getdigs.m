function out = getdigs(in)
  out = [];
 in=str2num(in);
  while in > 0
    out = [out mod(in,10)];
    in = floor(in/10); 
  end
  out = fliplr(out);
  
  end
