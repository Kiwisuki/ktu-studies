## Copyright (C) 2017 Erikas
## Author: Erikas 
## Created: 2017-12-13

#                              PAVYZDYS
# Pirminis skaicius p = 47, jo generatorius g = 19
# Slaptasis raktas x = 17. Programa pati apskaiciuoja Public Key, PuK = 26.
# Pasirenkama tekstograma t = 33 ir gaunama sifrograma. Net ir su tais paciais
# parametrais kas karta bus gaunama nauja sifrograma, nes k yra generuojamas atsitiktinai.
# Paimame viena is sifrogramu musu pasirinktai tekstogramai pvz (46,14). Ivedus i sita
# programele gausime ats = 33

function elg_dec 
p = input("Iveskite strongprime pirmini skaiciu p = ");
while(p<5 || isprime(p)==0 || isprime(((p-1)/2))==0)
p = input("Jusu ivestas skaicius nera strongprime. Prasome ivesti per nauja: ");
endwhile
g = input("Iveskite generatoriu g = ");
while(mod_exp(g,2,p)==1 || mod_exp(g,(p-1)/2,p)==1)
g = input("Jusu ivestas skaicius nera generatorius. Prasome iveskite per nauja: ");
endwhile
x = input("Sugeneruokite PrK = ");
while(x>p-2 || x==1)
x = input("Pasirinktas neteisingas slaptasis raktas. Prasome ivesti is naujo: ");
endwhile
printf("Jusu viesasis raktas a = %d\n",a=mod_exp(g,x,p))
c = input("Iveskite sifrograma formatu c = (E,D) c = ","s");
c = c(2:end-1);
c = strrep (c, ",", " ");
[gama, delta] = strread(c);
while(gama < 0 || gama>(p-1) || delta < 0 || delta > (p-1))
c = input("Ivedete neteisinga sifrograma, prasome ivesti is naujo: ","s");
[gama, delta] = strread(c);
endwhile
temp = mod_exp(gama,p-1-x,p);
printf("Gauta tekstograma t = %d \n",mod(temp*delta,p))
endfunction
