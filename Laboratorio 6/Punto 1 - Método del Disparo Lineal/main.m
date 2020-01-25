function Z = main()
  
  pkg load symbolic;
  syms t;
  
  while(true)
    try 
      str_function = input("Ingrese la función p(t): ");
      p = function_handle(sym(str_function));
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  while(true)
    try 
      str_function = input("Ingrese la función q(t): ");
      q = function_handle(sym(str_function));
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  while(true)
    try 
      str_function = input("Ingrese la función r(t): ");
      r = function_handle(sym(str_function));
      break;
    catch
      printf("Favor ingresar una función correcta\n");
    end_try_catch
  endwhile 
  
  while(true)
    try 
      a = input("Ingrese el valor inicial del intervalo a evaluar: ");
      a = a+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile 
  
  while(true)
    try 
      b = input("Ingrese el valor final del intervalo a evaluar: ");
      b = b+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile 
  
  while(true)
    try 
      A = input("Ingrese el resultado de la función evaluada en el valor inicial: ");
      A = A+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  while(true)
    try 
      B = input("Ingrese el resultado de la función evaluada en el valor final: ");
      B = B+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  while(true)
    try 
      h = input("Ingrese la distancia que hay entre cada una de las iteraciones: ");
      h = h+1-1;
      break;
    catch
      printf("Favor ingresar un valor adecuado\n");
    end_try_catch
  endwhile
  
  #while(true)
  #  try 
  #    str_function = input("Ingrese la función real: ");
  #    Y = function_handle(sym(str_function));
  #    break;
  #  catch
  #    printf("Favor ingresar una función correcta\n");
  #  end_try_catch
  #endwhile 
  o = (a:h:(b+h));
  Y = input("Ingrese la función real: ");
  DisparoLineal(p,q,r,a,b,A,B,h,Y)
endfunction
