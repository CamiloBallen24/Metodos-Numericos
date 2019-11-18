function S = Simpson (f,a,b,M)
  % Se halla la longitud de cada intervalo
  h = (b-a)/(2*M);
  sum1=0;
  sum2=0;
  %variable en la que se evaluara la funcion

  %Se halla la sumatoria de la funcion evaluada en numeros pares e impares
  for k=1:2*M-1
    if mod(k,2)==0
      h1=a+k*h;
      sum1 += f(h1);
    else
      h2=a+k*h;
      sum2 += f(h2); 
    endif
  endfor 
  
  
  %Se aplica la fórmula correspondiente
  S = (h/3)*(f(a) + f(b)) + (2*h/3)*sum1 + (4*h/3)*sum2 ;
  %Hallamos la diferencia entre el resultado obtenido, y el valor real de la integral
  E = abs(S - quad(f,a,b));
  %Se imprimen los valores obtenidos
  printf('Simpson: %f \n', S);
  printf('Error: %f \n\n', E);

endfunction
