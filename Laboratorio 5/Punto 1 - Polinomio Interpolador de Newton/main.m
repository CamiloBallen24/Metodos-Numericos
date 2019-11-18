% Se ingresa la funcion 
while 1
  try
    f = input('ingrese f(x): ');
    g = inline(f,'x');
    g(1);% se prueba la funcion
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile


#Se Ingresa numero de nodos
while(true)
  try 
    n = input("Ingrese el numero de Nodos: ");
    n = n+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Se Ingresa el Lado Izquierdo del Intervalo a
while(true)
  try 
    a = input("Ingrese el valor de a: ");
    a = a+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Se Ingresa el Lado Izquierdo del Intervalo b
while(true)
  try 
    b = input("Ingrese el valor de b: ");
    b = b+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Se Ingresa el valor X
while(true)
  try 
    x = input("Ingrese el valor de x, que quiere calcular la derivada: ");
    x = x+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

#Se Ingresa el valor h
while(true)
  try 
    h = input("Ingrese el valor de h: ");
    h = h+2-2;
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Llamada a la funcion
Derivada_PIN(f, n, a, b, x, h)















