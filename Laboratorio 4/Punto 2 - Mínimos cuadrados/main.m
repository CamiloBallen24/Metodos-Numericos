format long;

while(true)
  try 
    N = input("Ingrese el numero de puntos: ");
    N = N+1-1;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

while(true)
  try 
    X = input("Ingrese el vector de puntos en x: ");
    X(N);
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 


while(true)
  try 
    Y = input("Ingrese el vector de puntos en y: ");
    Y(N);
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 


while(true)
  try 
    M = input("Ingrese el grado m�ximo de la funci�n a generar: ");
    M = M+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

MinimosCuadrados(X,Y,N,M)