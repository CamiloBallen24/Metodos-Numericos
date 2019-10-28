pkg load symbolic;
syms x;
format long;

% Se ingresa la funcion correspondiente
while 1
  try
    f = input('ingrese f(x): ','s');
    f = inline(f,'x');
    f(1);% se prueba la funcion
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile

% Ingresa el numero de nodos
while 1
  try
    num_nodos = input('ingrese el numero de nodos a usar: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile

%Ingresa los nodos
X = zeros(1,num_nodos);
Y = zeros(1,num_nodos);
for i=1:num_nodos
  while 1
    try
      printf("Ingrese el nodo X%d",i-1);
      X(i) = input(": ");
      Y(i) = f(X(i));
      break;
    catch
      printf("Ingrese una numero\n");
    end_try_catch
  endwhile
endfor

  %se evalue el metodo
  PP=Newton(X,Y, num_nodos);
 % la funcion devuelve un string y se convierte en funcion
 P = function_handle(sym(PP));
 %se especifican los X con los cuales se va a aproximar
 w_pol = linspace(-3,4,100);
 %se Grafica
 plot(w_pol,P(w_pol),"b-");
 legend('Aproximacion');
 