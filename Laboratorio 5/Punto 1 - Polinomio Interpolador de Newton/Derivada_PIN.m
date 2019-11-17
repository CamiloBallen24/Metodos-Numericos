function x_prima = Derivada_PIN (f, n, a, b, x_evaluar, h)
  format long
  
  #Metodo #1
  #Formula para aproximacion con diferencias progresivas
  f_aux_1 = strrep(f, 'x', 'x+0.1');
  f_aux_2 = strrep(f, 'x', 'x+0.2');
  
  f_prima_diferencias_progresivas = strcat('((-3.*(', f, '))+(4.*(',f_aux_1,'))-(', f_aux_2, '))./0.2');
  f_prima_diferencias_progresivas = inline(f_prima_diferencias_progresivas, 'x');
  
  
  
  #Metodo #2
  #Derivada con el Polinomio Interpolador de Newton
  f = inline(f, 'x');
  
  T=[];
  for i=0:n-1
    T(i+1)= x_evaluar + (h*i);
  endfor
  
  X=T;
  Y=f(X);
  for i=1:n
    Y(i)=f(X(i));
  endfor
  
  coeficientes=PIN_Coeficientes(n,X,Y);
  
  #Hacer f'
  f_prima_PIN = num2str(coeficientes(1));
  auxiliar_string = '1';
  
  for i=2:n
    auxiliar_string = strcat(auxiliar_string, '.*(', 'x', '-(', num2str(T(i)), '))');
    f_prima_PIN = strcat(f_prima_PIN, '+', '(',  num2str(coeficientes(i)), '.*', auxiliar_string, ')');
  endfor
  
  f_prima_PIN = inline(f_prima_PIN, 'x')
  
  
  
  
  #Metodo #3
  syms x;
  f=f(x);
  f_prima_sym = diff(f,x);
  f_prima_sym = matlabFunction (f_prima_sym);
  
  
  
  #Mostrando resultados
  
  #Metodo #1
  disp("\n\nMetodo #1 - Usado diferencias progresivas")
  disp("\nFormula: ")
  disp(f_prima_diferencias_progresivas)
  disp("\nResultado:")
  disp(f_prima_diferencias_progresivas(x_evaluar))
  
  
  #Metodo #2
  disp("\n\n\n\nMetodo #2 - Polinomio de Interpolador de Newton")
  disp("\nFormula: ")
  disp(f_prima_PIN)
  disp("\nResultado:")
  disp(f_prima_PIN(x_evaluar)) 
  
 
  #Metodo #3
  disp("\n\n\n\nMetodo #3 - Usando Symbolic")
  disp("\nFormula: ")
  disp(f_prima_sym)
  disp("\nResultado:")
  disp(f_prima_sym(x_evaluar)) 
  
  
  #Graficas
  t=(0:0.01:5);
  
  plot(t, f_prima_diferencias_progresivas(t), 'r');
  hold on;
  
  plot(t, f_prima_PIN(t), 'b');
  hold on;
  
  plot(t, f_prima_sym(t), 'g');
  hold on;
  
  title ("Derivacion Aproximada");
  xlabel ("x");
  ylabel ("derivada x");
  legend('Diferencias Progresivas', 'PIN', 'Symbolic');
  
  hold off;

  
  
  
  #f_rara = (4.*(x).*log(x))+((cos((x)-3))./(sqrt(1+((x).^2))))
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
endfunction
