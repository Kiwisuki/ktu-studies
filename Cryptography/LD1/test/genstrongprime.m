%Generate strong primes
%>>genstrongprime(numberofbits)
%>> ans=18959
%
function p = genstrongprime(size)
% size is a length of strong prime in bits
  while 1
    q = genprime(size - 1);
    p = 2*q + 1;
    if isprime(p)
      break;
    end;
  end;
  p = int64(p);
end;
