%Concatinate two numbers return string type
%>>concat(2,3)
%>> ans = 23
function out = concat(a,b)
a = num2str(a);
b = num2str(b);
out = strcat(a,b);
end