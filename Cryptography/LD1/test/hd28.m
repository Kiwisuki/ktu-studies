% input - string array, i.e "asd"
% output - 28 LSBs in decimal form of SHA-256 
%>>H28('123456')
%ans = 182217874
function out = hd28(msg)
    %warning('off', 'Octave:possible-matlab-short-circuit-operator');
    % Convert message to array of ascii values
    ascarr = [];
    for i=1:length(msg)
      ascarr = [ascarr double(msg(i))];  
    end
    out = sha256(ascarr,28);
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

function out = bintohex(in)
    % pad the thing
    lenmod = mod(length(in),4);
    if lenmod ~= 0
      for i=1:(4-lenmod)
        in = [0 in];  
      end
    end
    out = [];
    for i=1:4:length(in)
     thisdig=0;
     thispow=1;
     for j=i+3:-1:i
       dval = in(j);
       if(dval == 1)
        thisdig=thisdig+thispow;
       end
       thispow=thispow*2;
     end
     
     if(thisdig < 10)
      thisdig=double('0') + thisdig;
     else
      thisdig=double('A')+(thisdig-10); 
     end
     out = num2str(out);
     out=[out char(thisdig)];
    end
end

function out = hextobin(in, bits)
  nxtarr = [];
  % convert to int array
  for i=1:length(in)
    if in(i) >= 'a' && in(i) <= 'f'
      nxtarr = [nxtarr (double(in(i))-double('a') + 10)];  
    else
      nxtarr = [nxtarr str2num(in(i))];  
    end
  end
  in = nxtarr;

  out = [];
  for i=length(in):-1:1
    % express this number in binary form
    dval = in(i);
    for j=1:4
      if ( mod(dval, 2) == 1)
        out=[1 out];
      else
        out=[0 out];
      end
      dval = floor(dval / 2);
    end
  end
  % return however many bits were needed
  retr = [];
  for i=length(out):-1:max(1,length(out)-bits+1)
    retr = [out(i) retr];
  end
  out = retr;
end

function out = hextodec(in)
    ans = 0;
    currPow = 1;
    for i=length(in):-1:1
      ans=ans+currPow * in(i);
      currPow = currPow* 16;
    end
    out = ans;
end
%}