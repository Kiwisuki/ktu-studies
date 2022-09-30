function m = pai_dec(fy, N, c)
% pai_dec - pagal Paillier metodà deðifravimas:
% Kvietimas:
% pai_dec(fy,n,c)
% Gràþinama reikðmë:
% m - deðifruotas tekstas 
 
    max = int64(9223372036854775807);
   
    N2 = N * N;
    
    if(N >= max || N2 >= max || fy >= max || c >= max) 
      error("Out of memory: Number overflow error");
    endif
    d1 = mod_exp(c, fy, N2);
    
    d2 = mod((d1-1)/N,N);
    
    d3 = mulinv(fy, N);
    
    if(mod(fy*d3, N) != 1)
      error("mulinv calculation incorrect != 1");
    endif
    
    if(d3 >= max || d2 * d3 >= max) 
      error("Out of memory: Number overflow error");
    endif
    
    m = mod(d2*d3,N);
    
endfunction