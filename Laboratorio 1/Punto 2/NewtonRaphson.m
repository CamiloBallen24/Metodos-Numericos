#### Copyright (C) 2019 Universidad Nacional de Colombia

#### Descripcion
#### Programa correspondiente a la implementacion del Metodo de Newton-Raphson, 
#### para la solucion de ecuaciones no lineales, este software pertenece al
#### desarrollo del punto 2 del laborario numero 1, de la materia Metodos Numericos
#### dictada por el profesor Edgar Miguel Vargas en la Universidad Nacional de Colombia

#### Autores: jdacostab@unal.edu.co cgilb@unal.edu.co jmedinan@unal.edu.co
#### Creado: 2019-09-07  

function y = NewtonRaphson(str_function, point0, root, aproximacion, iteraciones)
  #Se  define el formato de los valores para mayor precision
  format short;
  
  #Se cargar el paquete symbolic previamete instalado
  pkg load symbolic;
  syms x;
  
  #Se transforman las entradas en texto plano a funciones que manejables por octave y symbolic
  function_ = function_handle(sym(str_function));
  derivate = function_handle(diff(formula(function_(x))));
  
  #Se definen los parametros iniciales de la primera iteracion
  actual_image = function_(point0) - root;
  actual_point = point0;
  i = 0;
  
  #Se definen los vectores que almaceran la informacion del metodo
  k = ["______";" ";"K" ; "______"; " "];
  points = ["__________________";" ";"Points"; "__________________"; " "];
  images = ["_____________________";" ";"Images"; "_____________________"; " "];
  derivates = ["__________________";" ";"Derivates"; "__________________"; " " ];
  divisions = [" ";" | ";" | "; " | "; " | "];
  
  #Se inicia un ciclo que se ejecutara hasta que se encuentre la raiz o se revase 
  #el numero de iteraciones
  while abs(actual_image)>aproximacion && i<iteraciones
    
    #Se calculan los valores de la i-esima iteracion
    actual_image = function_(actual_point) - root;
    actual_derivate = derivate(actual_point);
    
    #Se almacenan los valores de la i-esima iteracion
    k=[k; mat2str(i)];
    points=[points; mat2str(actual_point)];
    images=[images; mat2str(actual_image)];
    derivates=[derivates; mat2str(actual_derivate)];
    divisions = [divisions; " | "];
    
    #Se calcula el siguiente punto aplicando el metodo de Newton-Raphson 
    actual_point = actual_point - (actual_image/actual_derivate);
    
    i++;
  endwhile
  
  
  #Se manipulan los datos para mostrarlos en el formato adecuado
  k = [k;"______"];
  points = [points;"__________________"];
  images = [images;"_____________________"];
  derivates = [derivates;"__________________"];
  divisions = [divisions;" | "];
  format short;
  table = [divisions k divisions points divisions images divisions derivates divisions]
  
  #Se imprime el valor de x en el que hay una raíz de la función
  format long;
  y = actual_point;
endfunction