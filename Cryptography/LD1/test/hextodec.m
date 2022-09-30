% input - hex string array, i.e "12345"
% output decimal result in array
function out = hextodec(in)
    ans = 0;
    currPow = 1;
    for i=length(in):-1:1
      ans+=currPow * in(i);
      currPow *= 16;
    endfor
    out = ans;
endfunction
