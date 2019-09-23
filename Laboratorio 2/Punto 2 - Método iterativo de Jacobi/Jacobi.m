#### Copyright (C) 2019 Universidad Nacional de Colombia

#### Descripcion
#### Programa correspondiente a la implementacion del Metodo iterativo Jacobi, 
#### para la solucion de ecuaciones no lineales, este software pertenece al
#### desarrollo del punto 2 del laborario numero 2, de la materia Metodos Numericos
#### dictada por el profesor Edgar Miguel Vargas en la Universidad Nacional de Colombia

#### Autores: jdacostab@unal.edu.co cgilb@unal.edu.co jmedinan@unal.edu.co
#### Creado: 2019-09-07

#La funcion lleva a cabo el metodo iterativo de Jacobi: (Tenemos AX=B)
#Matriz_A es la matriz A
#Vector_B es el vector B
#n es la dimension de la matriz es decir nxn
#Punto_0 es el punto de partida (puede ser cualquier punto)
#Punto_final es la solucion del sistema es deciur X
#Aproximacion se la distancia minima aceptable para conciderar el punto actual igual al punto final

function X = Jacobi(Matriz_A,Vector_B,n,Punto_0,Punto_final, Aproximacion, Maximo)
  
  #Validamos que matriz A sea Diagonal Estrictamente Dominante 
  Bandera = 0;
  
  #Se recorre todas y cada una de las filas
  for i=1:n
    suma=0;
    #Se suma el valor absoluta de la fila sin contar la diagonal
    for j=1:n
      if(i!=j)
        suma=suma+abs(Matriz_A(i,j));
      endif
    endfor
    #Se valida si la fila i es estrictamente dominate
    if(abs(Matriz_A(i,i))<=suma)
      Bandera = 1;
      break;
    endif
  endfor
  
  #En caso de que la matriz A sea Diagonal Estrictamente Dominante se realiza el proceso iterativo  
  if(Bandera==0)
    #Punto actual guardara el punto que se ira calculando a lo largo del proceso
    Punto_actual = Punto_0;
    Iteracion=0;
    Iteraciones = [Iteracion Punto_0 Distancia_puntos(Punto_actual,Punto_final,n)];
    
    #El proceso iterativo se realizara hasta que la distancia sea inferior a la 
    #aproximacion o se supere el numero maximo de iteraciones
    while(Distancia_puntos(Punto_actual,Punto_final,n)>Aproximacion && Iteracion<Maximo)
      #Acciendo uso del algoritmo visto en clase se calculo el valor del siguiente punto
      Punto_auxiliar = [];
      Datos = [];
      for i=1:n
       suma_fila=0;
       for j=1:n
        if(i!=j)
          suma_fila=suma_fila-(Matriz_A(i,j)*Punto_actual(j));
        endif
       endfor
       termino_xi=suma_fila+Vector_B(i);
       termino_xi=termino_xi/Matriz_A(i,i);
       Punto_auxiliar(i)=termino_xi;
       Datos = [Datos termino_xi];
      endfor
      Datos = [Datos Distancia_puntos(Punto_actual,Punto_final,n)];
      #Se ingresan los valores obtenidos a la matriz que luego se imprimira
      Iteraciones = [Iteraciones;Iteracion+1 Datos];
      #Se asigna el punto auxiliar al punto actual para continuar con el proceso
      Punto_actual=Punto_auxiliar;
      Iteracion++;
    endwhile
    #Se muestra la matriz de iteraciones haciendo las respectivas modificaciones para mejor su presentación
    format none;
    printf("\n   ---------------------- ----------------------- ----------------------- ----------------------- -----------------------\n")
    printf("  |      Iteración       |")
    for i=1:n
      printf("       Variable %i      |", i)
    endfor
    printf("      Convergencia     |\n")
    printf("   ----------------------")
    for i=1:n
      printf(" -----------------------")
    endfor
    printf(" -----------------------\n")
    format long;
    disp(Iteraciones)
    format short
    printf("\n Los valores son:");
    disp(Punto_actual);
  else
    #En caso contrario se reporta el error
    printf("La matriz A no es diagonal estrictamente dominante\n")
    X=-1;
  end
endfunction