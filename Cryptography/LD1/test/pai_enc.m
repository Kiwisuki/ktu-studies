function [c, r] = pai_enc(N, m)
% pai_enc - naudojamas uþðifruoti pagal Paillier metodà:
% Kvietimas:
% pai_enc(n,m)
% Gràþinimo bûdai:
% c = pai_enc(n,m) - gràþins tik "c" reikðmæ
% [c,r] = pai_enc(n,m) gràþins abi "c" ir "r" reikðmes
% Gràþinama reikðmës:
% c - uþðifruotas praneðimas
% r - sugeneruotas metodo viduje reikðmë
 
    max = int64(9223372036854775807);
    
    r=randi(N-1);
    index = 0;
    limit = 1000;
    while(index < limit && gcd(r, N) != 1)
      r = randi(N);
      index += 1;
    endwhile
    if (index >= limit)
      error("r variable generation limit reached: 1000");
    endif
    
    Np1 = N + 1;
    N2 = N * N;
    
    if(N >= max || Np1 >= max || N2 >= max) 
      error("Out of memory: Number overflow error");
    endif 
    
    c_1 = mod_exp(Np1, m, N2);
    c_2 = mod_exp(r,N,N2);
    
    c=mod(c_1*c_2,N2);
endfunction