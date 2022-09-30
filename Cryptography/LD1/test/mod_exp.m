% element g raised by n modulo p
%>>mod_exp(2,3,7)
%>>ans = 1
%
function r = mod_exp(g, n, p)
% skaiciuoja r=g^n mod p
    r = int64(1);
    g = int64(g);
    n = int64(n);
    p = int64(p);
    while n > 0
        if mod(n, 2) ~= 0
            r = mod(r * g, p);
        end
        n = bitshift(n, -1); % Apvalinimas zemyn (standartine matlab'o funkcija). Pvz. floor(4.99) = 4. 
        g = mod(g * g, p);
    end