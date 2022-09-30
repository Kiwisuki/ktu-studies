function r = mod_expv(g, n, p)
    g = int64(g);
    n = int64(n);
    p = int64(p);
    g1=g;
for i=1:length(n)
r(i) = int64(1);
g=g1;
% skaiciuoja r=g^n mod p
        while n(i) > 0
        if mod(n(i), 2) ~= 0
            r(i) = mod(r(i) * g, p);
        end
        n(i) = bitshift(n(i), -1); % Apvalinimas zemyn (standartine matlab'o funkcija). Pvz. floor(4.99) = 4. 
        g = mod(g * g, p);
    end
    end