% input - binary string array, i.e "101010"
% output decimal result in string format or number format if you add true to parameters
function out = bintodec(in, num)
  out = 0;
  currpow=1;
  for i=length(in):-1:1
    if(num)asd = cell2mat(in(1,i));
    else
    asd = str2num(in(i));
    end
    if (asd == 1)
      out = out + currpow;
    end
     currpow = currpow * 2;
  end
end
