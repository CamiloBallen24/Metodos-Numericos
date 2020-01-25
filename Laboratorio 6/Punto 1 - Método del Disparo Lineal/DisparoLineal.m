function Z = DisparoLineal(p,q,r,a,b,A,B,h,Y)
  
  M=(b-a)/h;
  U = RungeKutta(p,q,r,a,A,0,h,M);
  V = RungeKutta(p,q,r,a,0,1,h,M);
  
  C = (B-U(size(U)(2)))/(V(size(V)(2)));
  X = U+C*V;
  
  t = (a:h:(b+h));
  plot(t,X);
  hold on;
  plot(t,Y);
 
  printf("\n   ____________________________________\n");
  printf("  |  tj |    xj   |  x(tj)  | x(tj)-xj |\n");
  printf("  |-----|---------|---------|----------|\n");

  
  for i=1:M+1

    fila = cstrcat("  | ",num2str(a+(h*i),'%.1f'));
    
    if X(i)<0
      fila = cstrcat(fila," | ",num2str(X(i),'%.4f'));
    else
      fila = cstrcat(fila," |  ",num2str(X(i),'%.4f'));
    endif
    
    if Y(i)<0
      fila = cstrcat(fila," | ",num2str(Y(i),'%.4f'));
    else
      fila = cstrcat(fila," |  ",num2str(Y(i),'%.4f'));
    endif
    
    fila = cstrcat(fila," |  ",num2str(abs(X(i)-Y(i)),'%.4f'),"  |");
    
    disp(fila);
    
  endfor
  
  printf("  --------------------------------------\n");
  
endfunction