#### Copyright (C) 2019 Universidad Nacional de Colombia

#### Descripcion
#### Programa correspondiente a la implementacion del Metodo de Combinaciones Lineales 
#### en Mínimos Cuadrados, para el ajuste de curvas, este software pertenece al
#### desarrollo del punto 2 del laborario numero 4, de la materia Metodos Numericos
#### dictada por el profesor Edgar Miguel Vargas en la Universidad Nacional de Colombia

#### Autores: jdacostab@unal.edu.co cgilb@unal.edu.co jmedinan@unal.edu.co
#### Creado: 2019-10-28  

function Z = MinimosCuadrados(X,Y,N,M)
  
  #Para resolver el sistemas de ecuciones normales de Gauss, plantedo de forma Matricial
  #Se debe resolver lo siguiente: F'FC=F'Y
  
  #Por comodida se define la matriz traspuesta primero y partir de ella se calcula la normal
  F_transpuesta = [];
  
  #Primero sw recorrera todas y cada una de las M filas
  for j=1:M
    #Luego se recorrera todas y cada una de las N filas
    for i=1:N
      #El elemento (j,i) correspondera a tomar la abcisa Xi, y evaluarlo en la 
      #Funcion fj.
      #En este caso se esta trabanandjo con aproximacion polinomial, por lo cual
      #fj(x)=(x)^(j-1)
      F_transpuesta(j,i) = (X(i)^(j-1));
    endfor
  endfor
  #Se muestra la matriz transpuesta
  F_transpuesta
  
  #A partir de la matriz transpuesta se construye la matriz normal
  F = F_transpuesta'
  
  #Se da la vuelta a las Y con propositos de la operacion
  Y = Y'
  
  #Se resulve el sistema de ecuaciones 
  C = linsolve(F_transpuesta*F,F_transpuesta*Y);
  
  #Se gira el vector para facilitar su manejo
  C=C';
  
  
  #Ahora se cosntruye el polinomio teniendo en cuenta los coeficentes C y 
  #El hecho de estar trabajando con ajuste polinomial
  polinomio="";
  
  #El siguiente for indica el tamano del polinomio dado por M, el grado sera M-1
  for i=1:M
      #En el primer termino solamente se coeficente 1
      if(i==1)
        polinomio = strcat(polinomio,num2str(C(i)));      
        
      #En el segundo termino se agrega el coeficiente 2 y X
      elseif(i==2)
        #Si es menor que cero se omite el menos el coeficiente ya lo trae
        if(C(i)<0)
          polinomio = strcat(polinomio,num2str(C(i)), '*X');
        #Si es mayor que cero se agrega el mas
        else
          polinomio = strcat(polinomio,'+',num2str(C(i)), '*X');
        endif
      #En el resto de terminos se agrega el coeficente i, y X elevado a la i-1
    else
        #Si es menor que cero se omite el menos el coeficiente ya lo trae
        if(C(i)<0)
          polinomio = strcat(polinomio,num2str(C(i)), '*(X^',num2str(i-1),')');
        #Si es mayor que cero se agrega el mas
        else
          polinomio = strcat(polinomio,'+',num2str(C(i)), '*(X^',num2str(i-1),')');
        endif
      endif
   endfor
   
   #Finalmente se muestra el polinomio como resultado
   polinomio
   
endfunction
