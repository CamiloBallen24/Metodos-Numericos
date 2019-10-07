function P = Newton(X,Y,n,x,grado)
  format short;
  #Una vez recibido los valores se calcula  la tabla de diferencias hacia adelatante
  #La primera columna de la tabal sera las ordenadas recibidas es decir Y
  tabla_diferencias = [Y'];
  #Para contruir la tabla se itera desde 2(puesto que la primera columna ya existe) 
  #hasta n (numero de puntos con el que se trabajo)
  for i=2:n
    #Se construye la columna i, se debe deliminar el numero de iteraciones
    for j=1:n-i+1
      #Como indica el metodo se calcula el elemento i,j teniendo como referencia
      #la columna anteriore, su misma fila y la siguiente.
      tabla_diferencias(j,i) = tabla_diferencias(j+1,i-1) - tabla_diferencias(j,i-1);
    endfor
  endfor
  
  #Se muestra la tabla de diferencias con el formato adecuado
  tabla2=['Punto Xi', 'f[Xi]','?f[Xi]'];
  printf("\n   __________ ____________ ___________ ___________ ___________ ___________ _________\n")
  printf("  |    Xi    |   F[Xi]    |  dF[Xi]   |  d^2F[Xi] | d^3F[Xi]  | d^4F[Xi]  | d^5F[Xi]\n");
  printf("  |__________|____________|___________|___________|___________|___________|_________\n")
  tabla=[X' tabla_diferencias];
  disp(tabla);
  
  
  #Se calcula el intervalo h entre los puntos
  h=X(2)-X(1);
  
  #Se la distancia s (en h unidades) desde el primer punto hasta x que se quiere 
  #aproximar
  s=(x-X(1))/h;
  
  
  #Se evalua con ayuda de s, si es posible realizar una interpolacion con el x ingresado
  if(s>=0 && s<=n)
    
    #Se calcula el pivote que permitira una aproximacion mas adecuada
    pivote = floor(s);
    
    #Se calcula la distancia de la x desde su respectivo pivote
    s=s-pivote;
    
    #Se define el grado del polinomio
    grado_max = n-pivote-1;
    grado_min = min(grado,grado_max);
    
    #Se obtienes los coeficientes de la tabla de diferencias hacia delante=
    f = tabla_diferencias(pivote+1,1:n);
    
    #Se inicializa el polinomio y un contedor auxiliar
    polinomio="";
    contenedor_s="";
    
    #De acuerdo al grado del polinomio se iterara un numero determinado de veces
    for i=1:grado+1
      
      #El primera iteracion simplemente se anade el primer termino es decir el f[x0]
      if(i==1)
        polinomio = strcat(polinomio,num2str(f(i)));
        
     #En la segunda iteracion se anade el segundo termino es decir f[x1] y una 
     #simple s(distancia entre la x aproximar y su pivote)
      elseif(i==2)
        polinomio = strcat(polinomio,' + s',num2str(f(i)));
        contenedor_s = strcat(contenedor_s,'s');
      
      #En las demas iteraciones se debe usar el contendor que almacena los terminos s
      #los cuales se repieten a lo largo del polinomio, y se calcula el termino que 
      #lo acompana el cual es es f[xi]/(i-1)!
      else
        contenedor_s = strcat(contenedor_s,'(s-',num2str(i-2),')');
        polinomio = strcat(polinomio,'+',contenedor_s,num2str(f(i)/factorial(i-1)))
      endif
    endfor
    
    #Una vez se haya construido el polinomio se evalua
    printf('\n')
    polinomio
    
    
    #Ya que se ha contruido el polinomio se hace uso de este para aproximar x
    
    #Se hara uso de un proceso iterativo para no usar librerias, para ello se 
    #llevara regsitro del valor aproximado y un evaluador auxiliar
    valor_aproximado = f(1);
    evaluador_s = 1;
    
    #Se itera en todos y cada uno de los etrminos del polinomio
    for i=2:grado+1
      #Se actualiza el valor almacenado en evaluador
      evaluador_s = evaluador_s*(s-(i-2));
      #Se almacena el valor del termino i el la variable valor aproximado
      valor_aproximado = valor_aproximado+(evaluador_s*f(i)/factorial(i-1));
    endfor
    
    #Finalmente se imprime el valor aproximado de x generado por la funcion
    valor_aproximado
  endif
  
endfunction
