format long;

#Se lee el numero de punto
while(true)
  try 
    n = input("Ingrese el numero de puntos: ");
    n = n+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el vector de las abscisas X
while(true)
  try 
    X = input("Ingrese el vector de las abscisas X: ");
    h=X(2)-X(1);
    for i=1:n-1
      if(X(i+1)-X(i)!=h)
        X(n+1);
      endif
    endfor
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 

#Se lee el vector de ordenadas Y
while(true)
  try 
    Y = input("Ingrese el vector de ordenadas Y: ");
    Y(n);
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 

#Se lee el valor a interpolar
while(true)
  try 
    x = input("Ingrese el valor a interpolar: ");
    x = x+2-2;
    break;
  catch
    printf("Favor ingresar un punto apropiado\n");
  end_try_catch
endwhile 

#Ingrese el grado del polinomio que se daría
while(true)
  try 
    grado = input("Ingrese el grado del polinomio que se daría: ");
    grado = grado+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

Newton(X,Y,n,x,grado)