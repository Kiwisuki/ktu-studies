%c - ciphertext, d - private key, n - RSA module, m - message
%Function rsa_dec decrypts ciphertext with given private key and RSA module
function rsa_dec
display("This program decrypts a ciphertext c and returns a textogram m.");
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
  c=input("Type in the ciphertext c = ");
  if floor(c)~=c
    disp("\nCiphertext c is wrong. WHY?");%disp("\nCiphertext c has to be an integer.");
  elseif (1<c)*(c<n)
    cond=0;
  else disp("\nCiphertext c is wrong. WHY?");%disp("\nCiphertext c is wrong.\nIt has to be smaller than n and greater than 1.\n");
  endif;  
endwhile;

m=mod_exp(c,d,n);
printf("Textogram m = %i. \n", m);
endfunction;