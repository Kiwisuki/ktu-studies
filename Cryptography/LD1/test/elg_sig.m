%{
                             PAVYZDYS
                           
  Stiprus pirminis skaicius p = 47, jo generatorius g = 19.
  Slaptasis raktas PrK = 17. Viesasis raktas PuK = 26.
  Dokumento t, kuri norite pasirasyti, santraukos funkcija H(t) = 11. 
  Sveikasis skaicius k = 7, jam atvirkstinis km1=7^(-1)mod(46) = 33.
  E.parasas - tai skaiciu pora (r,s) = (30,1).  
  ------------------------------------------------------------------------------
  Paleidus programa:
  ...
  Kai uzbaigsite, vel iveskite elg_sig ir vykdykite dialogo
  reikalavimus ivedant apskaiciuotus ir pasirinktus parametrus : elg_sig  <--!!!
  
%}


function elg_sig
  
    printf( '\n Is anksto apskaiciuokite ir pasirinkite siuos parametrus: \n Stipru pirmini skaiciu p \n Generatoriu g \n Privatuji rakta PrK \n Viesaji rakta PuK \n Dokumento t, kuri norite pasirasyti, santraukos funkcija H(t) \n Konstanta k \n Apskaiciuokite km1=k^(-1)mod(p-1) \n Apskaiciuokite pirmaji pranesimo H(t) paraso parametra r \n Apskaiciuokite antraji pranesimo H(t) paraso parametra s \n' );   
    printf( '\n Kai uzbaigsite, vel iveskite elg_sig ' );   
    printf( 'ir vykdykite dialogo \n reikalavimus ivedant apskaiciuotus ir pasirinktus parametrus' );  
    prompt = ' : ';
    str = input(  prompt, 's' );
    
    if ( isempty( str ) )
      
      str = 'ne_elg_sig';
      
    end;  
    
    str2 = 'elg_sig';
  
    if ( eq( strcmp( str, str2 ), 1 ) ) 
    
      printf( '\n' );
    
      p = input( '  Iveskite stipru pirmini skaiciu p = ' );

        while ( isempty( p ) || ~eq( floor( p ), p ) || ( ~isprime( p ) ) || ~eq( floor( ( p-1 )/2 ),( p-1 )/2 ) || ( ~isprime( ( p-1 )/2 ) ) ) 

          p = input( '  Stiprus pirminis skaicius p apskaiciuotas neteisingai. Bandykite dar karta p = ' );

        end;

      g = input( '  Iveskite generatoriu g = ' );

        while ( isempty( g ) || ~eq( floor( g ), g ) || eq( mod_exp(g,( ( p-1 )/2), p ),1 ) || eq( mod_exp( g, 2, p ),1 ) || g >= p || g <= 1 )

          g = input( '  Generatorius g apskaiciuotas neteisingai. Bandykite dar karta g = ' );

        end;

      PrK = input( '  Sugeneruokite privatuji rakta PrK = ' ); 

        while ( ~eq( floor( PrK ), PrK ) || ~( ( PrK >= 2 ) && ( PrK <= ( p-2 ) ) ) )

          PrK = input( '  Slaptasis raktas pasirinktas neteisingai. Bandykite dar karta PrK = ' );

        end;

      PuK1 = mod_exp( g, PrK, p ); 
      PuK2 = input( '  Apskaiciuokite viesaji rakta PuK = ' );

        while ( isempty( PuK2 ) || ~( eq( PuK2, PuK1 ) ) ) 

          PuK2 = input( '  Viesasis raktas apskaiciuotas neteisingai. Bandykite dar karta PuK = ' );

        end;

      m = input( '  Iveskite dokumento t, kuri norite pasirasyti, santraukos funkcija H(t) = ' );

        while ( ~eq( floor( m ), m ) || ~( ( m >= 0 ) && ( m <= ( p-1 ) ) ) )

          m = input( '  Parametras H(t) pasirinktas neteisingai. Bandykite dar karta H(t) = ' ); 

        end;
    
      k = input( '  Iveskite skaiciu k = ' );
    
        while ( ~( ( ( k >= 1 ) && ( k <= ( p-2 ) ) ) ) || ~( eq( gcd( k,p-1 ), 1 ) ) ) 
          
          k = input( '  Parametras k parinktas neteisingai. Bandykite dar karta k = ' ); 
          
        end;
      
      r = mod_exp( g, k, p );
      [d, a, b] = gcd( k, p-1 );
      k_atv = mod( a, p-1 );
      s = mod( k_atv*m, p-1 )-mod( k_atv*PrK*r, p-1 );
    
      km1 = input( '  Iveskite skaiciu km1 = ' );
    
        while ( isempty( km1 ) || ~( eq( km1, k_atv ) ) ) 
          
          km1 = input( '  Parametras km1 apskaiciuotas neteisingai. Bandykite dar karta km1 = ' ); 
          
        end;
    
      r1 = input( '  Iveskite pirmaji pranesimo H(t) paraso parametra r = ' );
    
        while ( isempty( r1 ) || ~( eq( r, r1 ) ) ) 
          
          r1 = input( '  Parametras r apskaiciuotas neteisingai. Bandykite dar karta r = ' ); 
          
        end;
    
      s1 = input( '  Iveskite pirmaji pranesimo H(t) paraso parametra s = ' );
    
        while ( isempty( s1 ) || ~( eq( s, s1 ) ) ) 
          
          s1 = input( '  Parametras s apskaiciuotas neteisingai. Bandykite dar karta s = ' ); 
          
        end;
    
      v1 = mod( ( mod_exp( PuK2, r, p )*mod_exp( r, s, p ) ), p );
      v2 = mod_exp( g, m, p );
          
      if ( ( v1 == v2 ) && ~( eq( s, 0 ) ) )
  
        printf( '  TAIP, gavote teisinga ElGamalio paraso schema. \n' ); 
 
      else
  
        disp( '  NE.' );
        return; 
    
      end;
    
    
    end;
  
endfunction;