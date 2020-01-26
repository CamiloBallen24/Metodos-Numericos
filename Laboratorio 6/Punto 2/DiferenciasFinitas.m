function sol = DiferenciasFinitas(p,q,r,a,b,h,A,B)
  # se halla N
  N  = round((b-a)/h);

  #se ubica t en t0 que es a
  t  =  a;
  
  aa = []; # vector que guarda la posiciones (i,i) de la matriz
  bb = []; # vector que guarda la posiciones (i+1,i) de la matriz
  cc = []; # vector que guarda la posiciones (i,i+1) de la matriz
  Y  = [];  # lado derecho de la igualdad
  
  for i = 1:N-1
   ti = a + i*h; # se calculan los tiempo tj
   aa(i) = 2 + (h^2)*q(ti);
  
   if i>1
    bb(i) = (-h/2)*p(ti) - 1;
   endif
   
   if(i < N-1)
    cc(i) = (h/2)*p(ti) - 1;
   endif
   
  endfor
 
   # se rellan las posiciones faltantes de los vectores bb y cc
   bb(1)=0;
   cc(N-1) = 0;
   
  # se completa Y 
  for i =1:N-1
    Y(i) =-(h^2)*r(i);
    
    # se tiene en cuenta que al primer termino se le agrega e0
    if i==1
      t1 = a+ h; # t= t1
      e0 = ((h/2)*p(t1)+1)*A;
      Y(i)= Y(i)+e0;
    endif
    # se tiene en cuenta que al ultimo termino se le agrega eN
    if i==N-1
      tn_1 = a+ (N-1)*h; # t=tn_1
      eN = ((-h/2)*p(tn_1)+1)*B;
      Y(i)= Y(i)+eN;
    endif
    
  endfor 
   
   # se soluciona la matriz tridiagonal
   sol = tridiag(aa,bb,cc,Y);

endfunction
