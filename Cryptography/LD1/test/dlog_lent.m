function LL = dlog_lent(p)
% skaiciuoja logaritmu lentele mod p
% NEBAIGTA !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% SUSKAICIUOJA TIKTAI dexp_lent

for i=1:p-1
    for j=1:p-1
        LL(i,j)=mod(i^j,p);
        % Operat mod() reikia keisti i mod_exp()
    end
end
for j=1:p-1
    LL(1,j)=j;
end

%sort(M,2)        %Be kabliat isveda turini
                  %help sort => komandos aprasymas