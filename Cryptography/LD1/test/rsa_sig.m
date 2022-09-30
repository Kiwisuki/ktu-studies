%m - message, d - private key, n - RSA module, s - signature
%Function rsa_sig places a signature on a message m with given private key
%and RSA module
function rsa_sig
display("This program places a signature on a message m.");
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
  d=input("Type in RSA private key d = ");
  if floor(d)~=d
    disp("\nPrivate key d is wrong. WHY?");%disp("\nPrivate key d has to be an integer.");
  elseif (1<d)*(d<n)
      cond=0; 
  else disp("\nPrivate key d is wrong. WHY?");%disp("\nPrivate key d is wrong.\nIt has to be smaller than n and greater than 1.\n");
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

s=mod_exp(m,d,n);
printf("Signed message m = %i is s = %i. \n", m, s);
end;