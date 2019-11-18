function x_prima = Derivada_PIN (f, n, a, b, x_evaluar, h)
  format long
  
  #Metodo #1
  #Formula para aproximacion con diferencias progresivas
  
  #Se remplaza x por x+h, para las f que son similares
  f_aux_1 = strrep(f, 'x', 'x+0.1');
  f_aux_2 = strrep(f, 'x', 'x+0.2');
  
  #Usando concatenacion se crea el string de la formula
  f_prima_diferencias_progresivas = strcat('((-3.*(', f, '))+(4.*(',f_aux_1,'))-(', f_aux_2, '))./0.2');
  #Se contruye la funcion apartir del string
  f_prima_diferencias_progresivas = inline(f_prima_diferencias_progresivas, 'x');
  
  
  
  
  
  #Metodo #2
  #Derivada con el Polinomio Interpolador de Newton
  
  #Se crea la funcion f a partir del string
  f = inline(f, 'x');
  
  
  #Se calculan valores de T
  T=[];
  #El numero de t, sera el numero de nodos
  for i=0:n-1
    #Se calcula ti
    T(i+1)= x_evaluar + (h*i);
  endfor
  
  
  #Se toman las absisas X como T, y se calculan los Ordenadas Y
  X=T;
  Y=f(X);
  
  #Usando coeficientes_PIN, se calculan los coeficientes es decir los valores de a
  coeficientes=PIN_Coeficientes(n,X,Y);
  
  #Se construye f' a traves de un for
  f_prima_PIN = num2str(coeficientes(1));
  auxiliar_string = '1';
  
  #For para construir f'
  for i=2:n
    #Se acumula la parte del productorio
    auxiliar_string = strcat(auxiliar_string, '.*(', 'x', '-(', num2str(T(i)), '))');
    #Se añade el coeficiente y el producto a f'
    f_prima_PIN = strcat(f_prima_PIN, '+', '(',  num2str(coeficientes(i)), '.*', auxiliar_string, ')');
  endfor
  
  #Usando el string construido anteriormente, se contruye f'
  f_prima_PIN = inline(f_prima_PIN, 'x')
  
  
  
  
  #Metodo #3
  #Se importa symlolic
  syms x;
  #Se agrega f
  f=f(x);
  #Se calcula la derivada
  f_prima_sym = diff(f,x);
  f_prima_sym = matlabFunction (f_prima_sym);
  
  
  
  #Mostrando resultados
  
  #Metodo #1
  disp("\n\nMetodo #1 - Usado diferencias progresivas")
  disp("\nFormula: ")
  #Se imprime la funcion
  disp(f_prima_diferencias_progresivas)
  disp("\nResultado:")
  #se imprime el resultado
  disp(f_prima_diferencias_progresivas(x_evaluar))
  
  
  #Metodo #2
  disp("\n\n\n\nMetodo #2 - Polinomio de Interpolador de Newton")
  disp("\nFormula: ")
  #Se imprime la funcion
  disp(f_prima_PIN)
  disp("\nResultado:")
  #SE imprime el resultado
  disp(f_prima_PIN(x_evaluar)) 
  
 
  #Metodo #3
  disp("\n\n\n\nMetodo #3 - Usando Symbolic")
  disp("\nFormula: ")
  #Se imprime la funcion
  disp(f_prima_sym)
  disp("\nResultado:")
  #Se imprime el resultado
  disp(f_prima_sym(x_evaluar)) 
  
  
  #Graficas
  #Intervalo de las graficas
  t=(0:0.01:5);
  
  #Se grafica el metodo #1
  plot(t, f_prima_diferencias_progresivas(t), 'r');
  hold on;
  
  #Se grafica el metodo #2
  plot(t, f_prima_PIN(t), 'b');
  hold on;
  
  #Se grafica el metodo #3
  plot(t, f_prima_sym(t), 'g');
  hold on;
  
  #Se Añaden los detalles
  title ("Derivacion Aproximada");
  xlabel ("x");
  ylabel ("derivada x");
  legend('Diferencias Progresivas', 'PIN', 'Symbolic');
  
  hold off;

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
endfunction
