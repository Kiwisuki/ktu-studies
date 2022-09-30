%function B = Gauss_Jordan(A, p)
% Inverse matrix computation
function B = matinv(A, p)
    B = Inverse(A, p);
end

function B = Inverse(A, p)
    n = size(A,1);
    B = eye(n);
    tikr = 1;

    for i = 1:n
        [A, B, tikr] = In(A, B, i, n, p, tikr);
        if(tikr == 0)
            B = [];%NaN(n, 'like', A); 
%Pasikeist galima jei norima padaryt kitoki tikrinima, kai matrica neegzistuoja
            display('Inverse matrix does not exist');
            break;
        end

    end

    if(tikr)
        if(A(n, n) < 0)
            A = Sign(A, n, p, n);
            B = Sign(B, n, p, n);
        end
            if(A(n, n) ~= 1)
                if(mod(A(n, n), p) == 0)
                    tikr = 0;
                else
                   [A,B, tikr] = Division(A, A(n, n), n, p, n, tikr, B);
                end
            end
            if(tikr)
                for i = n : -1: 0

                    [A, B] = Out(A, B, i, n, p);
                end
            end

    end
end

function [A, B] = Out(A, B, a, n, p)
    for i = a - 1:-1:1
        mult = p - mod(A(i, a), p);
        for j = 1:n
            A(i,j) = mod(A(i, j) + mult * A(a, j), p);
            B(i,j) = mod(B(i, j) + mult * B(a, j), p);
        end
    end   
end

function [A, B, tikr] = In(A, B, a, n, p, tikr)
    if(tikr)
        if(A(a, a) < 0)
            A = Sign(A, n, p, a);
            B = Sign(B, n, p, a);
        end

        
        if(tikr)
            if(mod(A(a,a),2) == 0) 
                s = Search(n, A, a);
                if(s<0)
                    [A, B, tikr] = Division(A, A(a, a), n, p, a, tikr, B);
                    return;
                end
                if( p ~= -1)
                    A = Change(A, n, a, s, p);
                    B = Change(B, n, a, s, p);
                    if(A(a, a) < 0)
                        A = Sign(A, n, s, a);
                        B = Sign(B, n, s, a);
                    end
                    if(A(a, a)~= 0 && A(a, a) ~= 1)
                        [A, B, tikr] = Division(A, A(a, a), n, p, a, tikr, B);

                    end
                else
                    tikr = 0;
                end
            end
            if(A(a, a)~= 0 && A(a, a) ~= 1)
                [A, B, tikr] = Division(A, A(a, a), n, p, a, tikr, B);
            end
            for i = a + 1 :n
                mult = p - mod(A(i, a), p);
                for j = 1: n
                    B(i, j) = mod(B(i, j) + mult * B(a,j),p);
                    A(i, j) = mod(A(i, j) + mult * A(a,j),p);

                end
            end
        end
        
    end
end

function A = Change(A, n, a, pab, p)
    for j = 1: n
        A(a, j) = mod(A(a, j) + A(pab, j), p);
    end
end

function s = Search(n, A, a)
    for i = a + 1 : n
        if(mod(A(i, a),2) ~= 0)
            s = i;
            return;
        end
    end
    s = -1;
end

function [A,B, tikr] = Division(A, el, n, p, i, tikr, B)
    
    [d, x] = gcd(el, p);
    if(d == 1 && tikr)

        sk = mod(x, p);

        for j = 1: n
            A(i,j) = mod((A(i,j) * sk), p); 
            B(i,j) = mod((B(i,j) * sk), p); 
        end

    else
        tikr = 0;
    end
end

function A = Sign(A, n, p, i)
    for j = 1: n
        A(i,j) = A(i,j) + p; 
    end
end