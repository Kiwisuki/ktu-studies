%Binary xor operation
%>>a=dec2bin(5)
%>>b=dec2bin(7)
%>>binaryxor(a,b)
%>> ans = 10
%>> bin2dec(ans)
%>> ans = 2
function out = binaryxor(a, b)
  a=bin2dec(a);
  b=bin2dec(b);
  out=dec2bin(bitxor(a,b));
  
end
