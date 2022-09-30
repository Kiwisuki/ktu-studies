function DL = daug_lent(p)
% skaiciuoja daugybos lentele mod p

for i=1:p-1
    for j=1:p-1
        DL(i,j)=mod(i*j,p);
    end
end
