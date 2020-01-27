function Z = DisparoLineal(p,q,r,a,b,A,B,h,Y)
  
  #Se calculo el numero de divisones esto permitira determinar 
  #el numero de iteraciones
  M=(b-a)/h;
  
  #Se definen los sistemas de ecuaciones diferenciales de orden superior U y V 
  #y se resuleven eston sistemas con ayuda de RungeKutta N=4
  U = RungeKutta(p,q,r,a,A,0,h,M);
  V = RungeKutta(p,q,r,a,0,1,h,M);
  
  #Se calcula la constante C la cual permitira construir la  solucion
  C = (B-U(size(U)(2)))/(V(size(V)(2)));
  
  #Con ayuda de la constante C, y de U y V, se calcula la solucion para los 
  #M puntos dados por h
  X = U+C*V;
  
  #Se definen el arreglo t que permitira graficar los resultados
  t = (a:h:(b+h));
  
  #Se grafica la solucion numerica
  plot(t,X, 'b');
  hold on;
  
  #Se grafica la solucion analitica
  plot(t,Y, 'g');
  hold on;
  
  #Se Añaden los detalles
  title ("Problemas de Contorno - Disparo Lineal");
  xlabel ("t");
  ylabel ("x(t)");
  legend('Numerica', 'Analitica');
  
  hold off;
 
 
  #Por ultimo se muestra la tabla que contendra la solucion numerica y analitica
  printf("\n   ____________________________________\n");
  printf("  |  tj |    xj   |  x(tj)  | x(tj)-xj |\n");
  printf("  |-----|---------|---------|----------|\n");

  #Tabla iterada las M+1 veces
  for i=1:M+1
    
    #Se muestra el numero de la iteracion
    fila = cstrcat("  | ",num2str(a+(h*i),'%.1f'));
    
    #Se muestra la solucion numerica
    if X(i)<0
      fila = cstrcat(fila," | ",num2str(X(i),'%.4f'));
    else
      fila = cstrcat(fila," |  ",num2str(X(i),'%.4f'));
    endif
    
    #Se muestra la solucion real
    if Y(i)<0
      fila = cstrcat(fila," | ",num2str(Y(i),'%.4f'));
    else
      fila = cstrcat(fila," |  ",num2str(Y(i),'%.4f'));
    endif
    
    #Se muestra la diferencia en las soluciones
    fila = cstrcat(fila," |  ",num2str(abs(X(i)-Y(i)),'%.4f'),"  |");
    
    #Se muestra la fila
    disp(fila);
    
  endfor
  
  printf("  --------------------------------------\n");
  
endfunction