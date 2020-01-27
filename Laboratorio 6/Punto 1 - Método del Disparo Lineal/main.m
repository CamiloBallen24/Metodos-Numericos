function Z = main()
  
  #Se recibe la parte p(t) del x''(t)
  while(true)
    try 
      str_function = input("Ingrese la función p(t): ", 's');
      p = inline(str_function, 't');
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  
  #Se recibe la parte q(t) del x''(t)
  while(true)
    try 
      str_function = input("Ingrese la función q(t): ", 's');
      q = inline(str_function, 't');
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  
  #Se recibe la parte r(t) del x''(t)
  while(true)
    try 
      str_function = input("Ingrese la función r(t): ", 's');
      r = inline(str_function, 't');
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  
  #Se recibe el valor del limite inferior a
  while(true)
    try 
      a = input("Ingrese el valor inicial del intervalo a evaluar: ");
      a = a+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile 
  
  
  #Se recibe el valor del limite superior b
  while(true)
    try 
      b = input("Ingrese el valor final del intervalo a evaluar: ");
      b = b+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile 
  
  
  
  #Se recibe el valor de alpha
  while(true)
    try 
      A = input("Ingrese el resultado de la función evaluada en el valor inicial: ");
      A = A+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  
  #Se recibe el valor de beta
  while(true)
    try 
      B = input("Ingrese el resultado de la función evaluada en el valor final: ");
      B = B+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  
  #Se recibe el valor de h
  while(true)
    try 
      h = input("Ingrese la distancia que hay entre cada una de las iteraciones: ");
      h = h+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  
  #Se recibe la funcion real para comparar y poder graficar
  while(true)
    try
       o = (a:h:(b+h));
       Y = input("Ingrese la función real: ");
       break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  #Se llama la funcion disparo lineal encargada de resolver el ejercicio
  DisparoLineal(p,q,r,a,b,A,B,h,Y)
  
endfunction
