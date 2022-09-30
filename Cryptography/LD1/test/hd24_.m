% input - string array, i.e "asd"
% output - 24 LSBs in decimal form of SHA-256 

function out = hd24(msg)
    %warning('off', 'Octave:possible-matlab-short-circuit-operator');
    % Convert message to array of ascii values
    ascarr = [];
    for i=1:length(msg)
      ascarr = [ascarr double(msg(i))];  
    end
    out = sha256(ascarr,24);
    % Convert to decimal
    out = int64(bintodec(out,true));
end

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

