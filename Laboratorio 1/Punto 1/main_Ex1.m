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


% Se ingresa el intervalo
printf('Ingrese el intervalo [a,b]\n');
while 1
  try 
    i_a = input('ingrese a: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile

while 1
  try 
    i_b = input('ingrese b: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile


% Se ingresa el valor de f(x) para el cual se quiere hallar el valor de x 
while 1
  try 
    fx = input('ingrese el valor de f(x) para el cual quiere hallar el x correspondiente: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile


% Se ingresa que tan cercana debe ser la aproximacion
while 1
  try 
    aprox = input('ingrese que tan cercana de f(x) debe ser la aproximacion: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile


% Se ingresa un numero de iteraciones maximo en caso de que el metodo no 
% converga lo suficientemente rapido
while 1
  try 
    iter = input('Ingrese un numero maximo de iteraciones: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile

% Se llama la funcion
c = biseccionBolzano(f,i_a,i_b,fx,aprox,iter)
