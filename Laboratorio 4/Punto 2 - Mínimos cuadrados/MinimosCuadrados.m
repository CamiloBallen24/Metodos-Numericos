function Z = MinimosCuadrados(X,Y,N,M)
  F_transpuesta = [];
  for i=1:M
    for j=1:N
      F_transpuesta(i,j) = (X(j)^(i-1));
    endfor
  endfor
  F_transpuesta
  F = F_transpuesta'
  Y = Y'
  C = linsolve(F_transpuesta*F,F_transpuesta*Y);
  C=C';
  
  polinomio="";
  
  for i=1:M
      if(i==1)
        polinomio = strcat(polinomio,num2str(C(i)));      
      elseif(i==2)
        if(C(i)<0)
          polinomio = strcat(polinomio,num2str(C(i)), '*X');
        else
          polinomio = strcat(polinomio,'+',num2str(C(i)), '*X');
        endif
      else
        if(C(i)<0)
          polinomio = strcat(polinomio,num2str(C(i)), '*(X^',num2str(i-1),')');
        else
          polinomio = strcat(polinomio,'+',num2str(C(i)), '*(X^',num2str(i-1),')');
        endif
      endif
   endfor
   
   polinomio
   
endfunction
