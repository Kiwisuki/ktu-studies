## Copyright (C) 2017 Erikas
## Author: Erikas Valinskas MGTM 5/2
## Created: 2017-12-13

#                              PAVYZDYS
# Pirminis skaicius p = 47, jo generatorius g = 19
# Slaptasis raktas x = 17. Programa pati apskaiciuoja Public Key, PuK = 26.
# Pasirenkama tekstograma t = 33 ir gaunama sifrograma. Net ir su tais paciais
# parametrais kas karta bus gaunama nauja sifrograma, nes k yra generuojamas atsitiktinai.
# Paimame viena is sifrogramu musu pasirinktai tekstogramai pvz (46,14). Ivedus i sita
# programele gausime ats = 33
function elg_enc
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
t = input("Iveskite pranesima t = ");
while(t<0 || t>(p-1))
t = input("Ivestas pranesimas yra netinkamas. Prasome ivesti is naujo: ")
endwhile
k = randi(p-2);
while (k>p-2 || k==1)
k = randi(p-2);
endwhile
gama = mod_exp(g,k,p);
delta =  mod(mod(t,p)*mod_exp(a,k,p),p);
printf("Gauta sifrograma: c = (%d,%d) \n",gama,delta);
endfunction