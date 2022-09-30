% >> bin2hex('1010111100001000')
% ans = AF08
function out = bin2hex(x)
out = bin2dec(x);
out = dec2hex(out);
end