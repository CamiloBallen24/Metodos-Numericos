function X = FlujoVehicular(L,T,h,k,px,pt,a,vp)
  #Con el número de intervalos que se quieren calcular, hallamos la distancia que hay entre cada uno de ellos
  #Esto lo hacemos tanto para los intervalos de X (De distancia), como para los intervalos de T (De tiempo)
  dx=L/h;
  dt=T/k;
  
  #Llenamos la primera fila, y la primera columna de la matriz
  #Donde la primera fila son los valores de X en el instante de tiempo 0
  for i=1:dx+1
    matriz(1,i)=px((i-1)*h);
  end
  #Y la primera columna son los valores de T en la posición 0
  for i=2:dt+1
    matriz(i,1)=pt((i-1)*k);
  end
  
  #Una vez tenemos esta fila y columna, hacemos las iteraciones necesarias para completar la matriz de k*h
  #Para ello, utilizamos la ecuación indicada en el informe del proyecto
  for i=2:dx+1
    for j=2:dt+1
      densidad = matriz(j-1,i) + a * (k/h) * (matriz(j-1,i)-matriz(j-1,i-1));
      matriz(j,i)=densidad;
    endfor
  endfor
  
  #Cuando tenemos la matriz, procedemos a graficar estos resultados en una gráfica 3D
  figure;
  x=0:h:L;
  t=0:k:T;
  b=1:dx+1;
  c=1:dt+1;
  [x,t]=meshgrid(x,t);
  z=matriz(c,b);
  mesh(z)
  
  #Finalmente, hallamos el polinomio interpolador de Newton para la posición ingresada anteriormente
  #Para ello, hallamos los vectores vpx y vpy, para posteriormente realizar este proceso en la función Newton
  vpx=[];
  vpy=[];
  
  for i=1:dt+1
    vpx=[vpx (i-1)*k];
  endfor
  
  for j=1:dt+1
    vpy=[vpy matriz(j,vp)];
  endfor
  
  PP=Newton(vpx,vpy,vp)
  #Ahora graficamos el Polinomio Interpolador de Newton en otra ventana
  figure;
  funcion=inline(PP,'x');
  plot(vpx,funcion(vpx));
  #Y devolvemos la matriz que obtuvimos como resultado
  X=matriz;  
endfunction