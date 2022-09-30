%m - message, e - public exponent, n - RSA module, c - ciphertext
%Function rsa_enc encrypts message m with given public exponent and RSA module
function rsa_enc
display("This program encrypts a message m and returns a ciphertext c.");
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

c=mod_exp(m,e,n);
printf("Ciphertext c = %i. \n", c);
end;