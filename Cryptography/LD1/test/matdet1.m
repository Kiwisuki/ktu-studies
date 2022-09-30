% Matrix determinant computation mod p for bigger order matrices
% Using Gauss-Jordan method
function ans = matdet1(A, p)
    B = Inverse(A, p);
    ans = 1;
    for i = 1:length(A)
        ans = mod(ans* B(i,i),p);
    end
end

function A = Inverse(A, p)
    n = size(A,1);
    tikr = 1;

    for i = 1:n
        [A, tikr] = In(A, i, n, p, tikr, 1);
    end
    tikr = 1;
    if(tikr)
        if(A(n, n) < 0)
            A = Sign(A, n, p, n);
        end
            if(A(n, n) ~= 1)
                if(mod(A(n, n), p) == 0)
                    tikr = 0;
                else
                   [A,tikr] = Division(A, A(n, n), n, p, n, tikr);
                end
            end
    end

end

function [A, tikr] = In(A, a, n, p, tikr, time)
    if(tikr)
        if(A(a, a) < 0)
            A = Sign(A, n, p, a);
        end
        if(tikr)
            if(mod(A(a,a),2) == 0) 
                if (time == 1)
                    s = Search(n, A, a, p);
                else
                    s = SearchA(n, A, a);
                end
                if(s<0)
                    [A, tikr] = Division(A, A(a, a), n, p, a, tikr);
                else
                if( p ~= -1)
                    A = Change(A, n, a, s, p);
                    if(A(a, a) < 0)
                        A = Sign(A, n, s, a);
                    end
                    if(A(a, a)~= 0 && A(a, a) ~= 1)
                        [A, tikr] = Division(A, A(a, a), n, p, a, tikr);

                    end
                else
                    tikr = 0;
                end
                end
            end
            if(A(a, a)~= 0 && A(a, a) ~= 1)
                [A, tikr] = Division(A, A(a, a), n, p, a, tikr);
            end
            for i = a + 1 :n
                mult = p - mod(A(i, a), p);
                for j = 1: n
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
function s = SearchA(n, A, a)
    for i = a + 1 : n
        if(A(i, a)~= 0)
            s = i;
            return;
        end
    end
    s = -1;
end

function s = Search(n, A, a,p)
    for i = a + 1 : n
        if(mod(A(i, a)+A(a, a),p) ~= 0)
            s = i;
            return;
        end
    end
    s = -1;
end

function [A,tikr] = Division(A, el, n, p, i, tikr)
    
    [d, x] = gcd(el, p);
    if(d == 1 && tikr)

        sk = mod(x, p);

        for j = 1: n
            A(i,j) = mod((A(i,j) * sk), p); 
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