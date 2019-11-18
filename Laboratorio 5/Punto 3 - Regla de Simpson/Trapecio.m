
function T = Trapecio(f,a,b,M)
  % Se halla la longitud de cada intervalo
  h = (b-a)/M;
  % Se declara la variable en la que se evaluará la funcion
  sum=0;

  %Se halla la sumatoria de las funcion evaluada en todos los puntos del intervalo
  for k=1:M-1
     h1=a+k*h;
     sum += f(h1);
  endfor

  %Se aplica la fórmula correspondiente
  T = (h/2)*(f(a) + f(b)) + (h)*sum ;
  %Hallamos la diferencia entre el resultado obtenido, y el valor real de la integral
  E = abs(T - quad(f,a,b));
  %Se imprimen los valores obtenidos
  printf('Trapecio: %f \n', T);
  printf('Error: %f \n\n', E);
  
endfunction
