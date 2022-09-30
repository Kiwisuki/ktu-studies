% >> bin=hex2bin('AF08')
% bin = 1010111100001000
% >> bin=hex2bin('af08')
% >>bin = 1010111100001000
function out = hex2bin(x)
out = hex2dec(x);
out = dec2bin(out);
end