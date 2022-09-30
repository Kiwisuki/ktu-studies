%Changes input data types and execute mod operation
%>> modn(11,5)
%>> ans = 1
function out = modn(a,n)
a=int64(a);
n=int64(n);
out = mod(a,n);
end