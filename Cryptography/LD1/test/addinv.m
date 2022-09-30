% Inverse element of additive group
% a+(-a)=0
%Example:
%>> a = 5;
%>> p = 7;
%>> addinv(a,p)
%>> ans = 2
%
function out = addinv(number, modulo)

out = mod(- number,modulo);

end
