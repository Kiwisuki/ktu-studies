function out = dectobin(in)
  out = [];
  while(in > 0)
    if mod(in, 2) == 1
      out=[1, out];
    else
      out=[0, out];
    endif
    in = floor(in / 2);
  endwhile
endfunction
