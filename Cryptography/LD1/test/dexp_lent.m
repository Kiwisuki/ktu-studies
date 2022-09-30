function DEP = dexp_lent(n)
% skaiciuoja eksponenciu lentele mod n

for i=1:n-1
    %for j=1:(n)
    for j=1:(n-1)
        DEP(i,j)=mod_exp(i, j, n);
    end
end

for j=1:(n-1)
%for j=1:(n)
    DEP(1,j)=j;
end

%sort(M,2)        %Be kabliat isveda turini
                  %help sort => komandos aprasymas