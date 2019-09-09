pkg load symbolic;
syms x;
format long;

#Se lee la funcion que se le desea hallar la raiz 
while(true)
  try 
    str_function = input("Ingrese la función a la cual se le hallará la raiz: ");
    function_auxiliar(x) = str_function;
    break;
  catch
    printf("Favor ingresar una funcion apropiada\n");
  end_try_catch
endwhile 



# Se lee el punto de partida
while(true)
  try
    point0 = input("Ingrese el valor Point 0: ");
    break;
  end_try_catch
    printf("Por favor ingresar un numero real\n");
endwhile 




# Se lee la raiz
while(true)
  try
    root = input("Ingrese el valor de f(x) para el cual quiere hallar el x correspondiente: ");
    break;
  end_try_catch
    printf("Por favor ingresar un numero real\n");
endwhile 




% Se ingresa que tan cercana debe ser la aproximacion
while(true)
  try 
    aproximacion = input('Ingrese que tan cercana de f(x) debe ser la aproximacion: ');
    break;
  catch
    printf("Ingrese una numero entero\n");
  end_try_catch
endwhile



% Se ingresa un numero de iteraciones maximo en caso de que el metodo no 
% converga lo suficientemente rapido
while(true)
  try 
    iteraciones = input('Ingrese un numero maximo de iteraciones maximo: ');
    break;
  catch
    printf("Ingrese una numero entero\n");
  end_try_catch
endwhile

p = NewtonRaphson(str_function, point0, root, aproximacion, iteraciones)