format long;

#Se lee el tamaño de la matriz A
while(true)
  try 
    n = input("Ingrese el tamaño de la matriz A: ");
    n = n+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee la matriz A
while(true)
  try 
    Matriz_A = input("Ingrese los coeficientes del sistema de ecuaciones como una matriz: ");
    Matriz_A(n,n);
    break;
  catch
    printf("Favor ingresar una matriz apropiada\n");
  end_try_catch
endwhile 

#Se lee el vector B
while(true)
  try 
    Vector_B = input("Ingrese el vector B: ");
    Vector_B(n);
    break;
  catch
    printf("Favor ingresar un vector apropiado\n");
  end_try_catch
endwhile 

#Se lee el punto inicial
while(true)
  try 
    Punto_0 = input("Ingrese el punto inicial: ");
    Punto_0(n);
    break;
  catch
    printf("Favor ingresar un punto apropiado\n");
  end_try_catch
endwhile 

#Se lee el punto final
while(true)
  try 
    Punto_final = input("Ingrese el punto final: ");
    Punto_final(n);
    break;
  catch
    printf("Favor ingresar un punto apropiado\n");
  end_try_catch
endwhile 

#Se lee la aproximación
while(true)
  try 
    Aproximacion = input("Ingrese la aproximacion: ");
    Aproximacion = Aproximacion+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se lee el numero máximo de iteraciones en caso de no alcanzar la aproximación
while(true)
  try 
    Maximo = input("Ingrese el numero maximo de iteraciones: ");
    Maximo = Maximo+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

Jacobi(Matriz_A,Vector_B,n,Punto_0,Punto_final,Aproximacion,Maximo)