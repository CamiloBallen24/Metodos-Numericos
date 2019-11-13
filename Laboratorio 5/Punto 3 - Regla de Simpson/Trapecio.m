
function T = Trapecio(f,a,b,M)
  % Se halla la longitud de cada intervalo
  h = (b-a)/M;
  sum=0;
  %variable en la que se evaluara la funcion

  %Se halla la sumatoria de las funciones evaluada en numeros pares e impares
  for k=1:M-1
     h1=a+k*h;
     sum += f(h1);
  endfor

  %Se aplica la formula correspondiente
  T = (h/2)*(f(a) + f(b)) + (h)*sum ;
  E = abs(T - quad(f,a,b));
  printf('Trapecio: %f \n', T);
  printf('Error: %f \n\n', E);
  
endfunction