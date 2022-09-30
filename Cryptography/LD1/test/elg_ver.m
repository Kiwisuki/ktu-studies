%{
                             PAVYZDYS
                             
  Pirminis skaicius p = 47, jo generatorius g = 19. 
  Slaptasis raktas PrK = 17. Viesasis raktas PuK = 26.
  Dokumento t, kurio parasa norite patikrinti, santraukos funkcija H(t) = 11. 
  E.parasas yra skaiciu pora (r,s) = (30,1). Patikros parametrai
  v1 = ((g^a)^r)*(r^s)mod(p) = 29  bei  v2 = (g^m)mod(p) = 29, vadinasi galima 
  teigti, jog parasas yra tikras.
  ------------------------------------------------------------------------------
  Paleidus programa:
  ...
  Kai uzbaigsite, vel iveskite elg_sig ir vykdykite dialogo
  reikalavimus ivedant apskaiciuotus ir pasirinktus parametrus : elg_ver  <--!!!
  
%}


function elg_ver

    printf( '\n Is anksto apskaiciuokite ir pasirinkite siuos parametrus: \n Stipru pirmini skaiciu p \n Generatoriu g \n Privatuji rakta PrK \n Viesaji rakta PuK \n Dokumento t, kuri norite pasirasyti, santraukos funkcija H(t) \n Apskaiciuokite pirmaji pranesimo H(t) paraso parametra r \n Apskaiciuokite antraji pranesimo H(t) paraso parametra s \n Apskaiciuokite patikros parametrus: v1, v2 \n' );   
    printf( '\n Kai uzbaigsite, vel iveskite elg_ver ' );   
    printf( 'ir vykdykite dialogo \n reikalavimus ivedant apskaiciuotus ir pasirinktus parametrus' );  
    prompt = ' : ';
    str = input(  prompt, 's' );
    
    if isempty( str )
      
      str = 'ne_elg_ver';
      
    end;  
    
    str2 = 'elg_ver';
  
    if ( eq( strcmp( str, str2 ), 1 ) ) 
      
      printf( '\n' );
    
      p = input( '  Iveskite stipru pirmini skaiciu p = ' );

        while ( isempty( p ) || ~eq( floor( p ),p ) || ( ~isprime( p ) ) || ~eq( floor( ( p-1 )/2 ),( p-1 )/2 ) || ( ~isprime( ( p-1 )/2 ) ) ) 

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

      m = input( '  Iveskite dokumento t, kurio parasa norite patikrinti, santraukos funkcija H(t) = ' );

        while ( ~eq( floor( m ), m ) || ~( ( m >= 0 ) && ( m <= ( p-1 ) ) ) )

          m = input( '  Parametras H(t) pasirinktas neteisingai. Bandykite dar karta H(t) = ' ); 

        end;
  
      r1 = input( '  Iveskite pirmaji pranesimo H(t) paraso parametra r = ' );
    
        while ( isempty( r1 ) ) 
          
          r1 = input( '  Parametras r apskaiciuotas neteisingai. Bandykite dar karta r = ' ); 
          
        end;
    
      if ( ~( ( r1 >= 0 ) && ( r1 <= p ) ) )
    
        disp( '  Pirmasis pranesimo H(t) paraso parametras r nepatenka i intervala [0;p]. Ar parasas tikras?' );
        return; 
    
      end;
    
      s1 = input( '  Iveskite antraji pranesimo H(t) paraso parametra s = ' );
    
        while ( isempty( s1 ) ) 
          
          s1 = input( '  Parametras s apskaiciuotas neteisingai. Bandykite dar karta s = ' ); 
          
        end;
    
      if ( ~( (s1 >= 0 ) && ( s1 <= ( p-1 ) ) ) )
    
        disp( '  Antrasis pranesimo H(t) paraso parametras s nepatenka i intervala [0;p-1]. Ar parasas tikras?' );
        return; 
      
      end;
    
      v1 = mod( ( mod_exp( PuK2, r1, p )*mod_exp( r1, s1, p ) ), p );
      v2 = mod_exp( g, m, p );
      
      v1_i = input( '  Iveskite pirmaji patikros parametra v1 = ' );
    
        while ( isempty( v1_i ) || ( ( ~eq( v1, v1_i ) )  && ( ~eq( v2, v1_i ) ) ) ) 
          
          v1_i = input( '  Parametras v1 apskaiciuotas neteisingai. Bandykite dar karta v1 = ' ); 
          
        end;
      
      v_next_i_like = 0;
      
      if ( eq( v1_i, v1  ) )
       
       v_next_i_like = v2;
      
      end;
      
      if ( eq( v1_i, v2  ) )
       
       v_next_i_like = v1;
      
      end;
      
      v2_i = input( '  Iveskite antraji patikros parametra v2 = ' );
    
        while ( isempty( v2_i ) || ~( eq( v_next_i_like, v2_i ) ) ) 
          
          v2_i = input( '  Parametras v2 apskaiciuotas neteisingai. Bandykite dar karta v2 = ' ); 
          
        end;
  
      printf( '\n  Turima: \n  v1 = %d ir v2 = %d.\n  Ar parasas tikras? \n', v1, v2 );
      
    end;

endfunction;