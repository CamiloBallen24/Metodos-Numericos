function X = Main()
  #Se ingresa la longitud en la que se quiere evaluar la densidad del tráfico
  while(true)
    try
      L = input("Ingrese la longitud L en la que quiere evaluar la densidad del tráfico: ");
      L = L+1-1;
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile
  
  #Se ingresa el número de segundos en los que se quieren evaluar la densidad del tráfico
  while(true)
    try
      T = input("Ingrese el número de segundos T en el que quiere evaluar la densidad del tráfico: ");
      T = T+1-1;
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile
  
  #Se ingresa el tamaño de los intervalos de la longitud L
  while(true)
    try
      h = input("Ingrese el tamaño que desea que tengan los intervalos h de la longitud: ");
      h = h+1-1;
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile
  
  #Se ingresa el tamaño de los intervalos del tiempo T
  while(true)
    try
      k = input("Ingrese el tamaño que desea que tengan los intervalos k del tiempo: ");
      k = k+1-1;
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile

  #Se ingresa el vector de los puntos X de la función p(x,0)
  while(true)
    try
      pxx = input("Ingrese el vector de puntos X de la función p(x,0): ");
      pxx(1);
      break;
    catch
      printf("Favor ingresar un vector apropiado\n");
    end_try_catch
  endwhile

  #Se ingresa el vector de los puntos Y de la función p(x,0)
  while(true)
    try
      pxy = input("Ingrese el vector de puntos Y de la función p(x,0): ");
      pxy(length(pxx));
      break;
    catch
      printf("Favor ingresar un vector apropiado\n");
    end_try_catch
  endwhile

  #Se ingresa el vector de los puntos X de la función p(0,x)
  while(true)
    try 
      ptx = input("Ingrese el vector de puntos X de la función p(0,x): ");
      break;
    catch
      printf("Favor ingresar un vector apropiado\n");
    end_try_catch
  endwhile

  #Se ingresa el vector de los puntos Y de la función p(0,x)
  while(true)
    try
      pty = input("Ingrese el vector de puntos Y de la función p(0,x): ");
      break;
    catch
      printf("Favor ingresar un vector apropiado\n");
    end_try_catch
  endwhile

  #Se ingresa la velocidad de los vehículos
  while(true)
    try
      a = input("Ingrese la velocidad a que tendrán los vehículos en la vía: ");
      a = a+1-1;
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile
  
  #Se ingresa el número del intervalo de la posición a la cual se le quiere hallar el polinomio interpolador de Newton
  while(true)
    try
      vp = input("Ingrese el número del intervalo de la posición al cual quiere hacer hallar el polinomio interpolador de Newton: ");
      while(vp>h)
        vp = input("Ingrese un valor menor al número de intervalos h que se va a evaluar: ");
      break;
    catch
      printf("Favor ingresar un valor apropiado\n");
    end_try_catch
  endwhile
  
  #Con los puntos X y Y recibidos tanto para px, como para py, hallamos una función que aproxime estos valores
  #Por medio del método de mínimos cuadrados
  px = inline(MinimosCuadrados(pxx,pxy,4,3),'X')
  pt = inline(MinimosCuadrados(ptx,pty,4,3),'X')

  #Con los valores que tenemos hasta ahora, utilizamos la función FlujoVehicular para hallar las densidades en los intervalos
  densidad = FlujoVehicular(L,T,h,k,px,pt,a,vp);
  #Una vez tenemos los valores de la densidad, hacemos un archivo Excel en el cual guardamos los valores obtenidos
  csvwrite('Densidad.csv',densidad)
endfunction