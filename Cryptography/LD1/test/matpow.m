function M = matpow(A,n,p)
if(n > 0)
M = A;

for i = 2:n
M = matmult(M,A,p);
end
else
    disp('Power is not greater than 0');
end

end