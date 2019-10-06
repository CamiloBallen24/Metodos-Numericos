function P = Newton(X,Y,n,x,grado)
  format short;
  #Hacemos la tabla de diferencias de los valores dados
  tabla_diferencias = [Y'];
  for i=2:n
    for j=1:n-i+1
      tabla_diferencias(j,i) = tabla_diferencias(j+1,i-1) - tabla_diferencias(j,i-1);
    endfor
  endfor
  
  tabla2=['Punto Xi', 'f[Xi]','?f[Xi]'];
  
  printf("\n   __________ ____________ ___________ ___________ ___________ ___________ _________\n")
  printf("  |    Xi    |   F[Xi]    |  dF[Xi]   |  d^2F[Xi] | d^3F[Xi]  | d^4F[Xi]  | d^5F[Xi]\n");
  printf("  |__________|____________|___________|___________|___________|___________|_________\n")
  tabla=[X' tabla_diferencias];
  disp(tabla);
  
  h=X(2)-X(1);
  s=(x-X(1))/h;
  
  if(s>=0 && s<=n)
    pivote = floor(s);
    s=s-pivote;
    grado_max = n-pivote-1;
    grado_min = min(grado,grado_max);
    
    f = tabla_diferencias(pivote+1,1:n);
    
    polinomio="";
    contenedor_s="";
    
    for i=1:grado+1
      if(i==1)
        polinomio = strcat(polinomio,num2str(f(i)));
      elseif(i==2)
        polinomio = strcat(polinomio,' + s',num2str(f(i)));
        contenedor_s = strcat(contenedor_s,'s');
      else
        contenedor_s = strcat(contenedor_s,'(s-',num2str(i-2),')');
        polinomio = strcat(polinomio,'+',contenedor_s,num2str(f(i)/factorial(i-1)))
      endif
    endfor
    printf('\n')
    polinomio
    
    valor_aproximado = f(1);
    evaluador_s = 1;
    
    for i=2:grado+1
      evaluador_s = evaluador_s*(s-(i-2));
      valor_aproximado = valor_aproximado+(evaluador_s*f(i)/factorial(i-1));
    endfor
    
    valor_aproximado
  endif
  
endfunction
