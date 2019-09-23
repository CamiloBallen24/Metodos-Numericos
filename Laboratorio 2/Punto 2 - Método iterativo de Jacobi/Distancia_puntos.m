#### Copyright (C) 2019 Universidad Nacional de Colombia

#### Descripcion
#### Programa correspondiente a la implementacion del Metodo iterativo Jacobi, 
#### para la solucion de ecuaciones no lineales, este software pertenece al
#### desarrollo del punto 2 del laborario numero 2, de la materia Metodos Numericos
#### dictada por el profesor Edgar Miguel Vargas en la Universidad Nacional de Colombia

#### Autores: jdacostab@unal.edu.co cgilb@unal.edu.co jmedinan@unal.edu.co
#### Creado: 2019-09-07  

#Esta funcion halla la distancia entre 2 puntos de dimension n
function d = Distancia_puntos (Punto_A, Punto_B, n)
  suma=0;
  #Sumatoria del cuadrado de la resta de los valores de ambos vectores
  for i=1:n
    suma=suma+((Punto_A(i)-Punto_B(i))^2);
  endfor
  #Hallamos y devolvemos la raiz cuadrada de la anterior sumatoria
  d = sqrt(suma);
endfunction
