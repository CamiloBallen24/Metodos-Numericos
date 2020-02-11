function P = Newton(X,Y,n)
   #Se construye la tabal de diferencias
   #La primera columna de la tabla de diferencias son las ordenadas
   tabla_diferencias = [Y'];
   
   #Se realiza las iteraciones que permitiran la construccion de la tabla
   #Comienza desde 2 ya que primera columna son las ordenadas
   for i=2:n
    #Se construye la columna i, se debe delimitar el numero de iteraciones
    for j=1:n-i+1
      #Como indica el metodo se calcula el elemento i,j teniendo como referencia
      #la columna anterior, su misma fila, la siguiente, y los coefientes del denominador.
      tabla_diferencias(j,i) = (tabla_diferencias(j+1,i-1) - tabla_diferencias(j,i-1))/(X(i+j-1)-X(j));
    endfor
  endfor
 
  #tabla_diferencias
  #Se obteiene los coefientes del nuevo polinomio
  f = tabla_diferencias(1,1:n);
 
  #Se crea una variable que alamcenara el polinomio y un concatenador auxiliar
  polinomio = "";
  concatenador = "";
 
  #Ya que el polinomio resultante es de grado n-1, este tendra n terminos
  for i=1:n
    #En el primer termino solamente se añade el coefiente a0
    if(i==1)
      polinomio = strcat(polinomio,num2str(f(i)));
   
    #En los demas casos se añade el coefiente multiplicado por los teminos (x-xi)
    #que esta almaceando en el concatenador.
    else
      concatenador = strcat(concatenador,'.*(x-(', num2str(X(i-1)), '))');
      polinomio = strcat(polinomio, ' + (', num2str(f(i)), ')',concatenador);endif
  endfor
 
  #Finalmente se regresa el polinomio
  P = polinomio;
endfunction