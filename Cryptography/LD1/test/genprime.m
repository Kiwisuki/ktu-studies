% Generate prime number
%>>genprime(numberofbits)
%>> ans = 97
%
function p = genprime(size)
  while 1
    q = randi([2^(size-2) 2^(size - 1) - 1]);
    p = 2*q + 1;
    if isprime(p)
      break;
    end;
  end;
  p = int64(p); 
end

