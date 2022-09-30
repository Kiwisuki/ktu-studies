%m - message, d - private key, n - RSA module, s - signature
%Function rsa_ver_sig verifies signature of a message m with given
%public exponent and RSA module
function rsa_ver
display("This program verifies whether the signature s of a message m is authentic.");
cond=1;
while cond
  n=input("Type in the RSA module n = ");
  if floor(n)~=n
    disp("\nRSA module n is wrong. WHY?");%disp("\nRSA module n has to be an integer.");
  elseif 2<n
    cond=0;
  else disp("\nRSA module n is wrong. WHY?");%disp("\nRSA module n has to be a bigger number.");
  endif;
endwhile;

cond=1;
while cond
  e=input("Type in RSA public exponent e = ");
  if floor(e)~=e
    disp("\nPublic exponent e is wrong. WHY?");%disp("\nPublic exponent e has to be an integer.");
  elseif (1<e)*(e<n)
      cond=0; 
  else disp("\nPublic exponent e is wrong. WHY?");%disp("\nPublic exponent e is wrong.\nIt has to be smaller than n and greater than 1.\n");
  endif;
endwhile;

cond=1;
while cond
  m=input("Type in the message m = ");
  if floor(m)~=m
    disp("\nMessage m is wrong. WHY?");%disp("\nMessage m has to be an integer.");
  elseif (1<m)*(m<n)
    cond=0;
  else disp("\nMessage m is wrong. WHY?");%disp("\nMessage m is wrong.\nIt has to be smaller than n and greater than 1.\n");
  endif;  
endwhile;

cond=1;
while cond
  s=input("Type in the signature of a message. s = ");
  if floor(s)~=s
    disp("\nSignature s is wrong. WHY?");%disp("\nSignature s has to be an integer.");
  elseif (1<s)*(s<n)
    cond=0;
  else disp("\nSignature s is wrong. WHY?");%disp("\nSignature s is wrong.\nIt has to be smaller than n and greater than 1.\n");
  endif;  
endwhile;

if mod_exp(s, e, n)== m
  disp("Signature is authentic.");
else disp("Signature is NOT authentic");
endif;
end;