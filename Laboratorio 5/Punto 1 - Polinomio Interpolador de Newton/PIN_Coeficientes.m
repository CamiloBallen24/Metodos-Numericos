function Coeficientes = PIN_Coeficientes (numero_nodos, X, Y)
  format long
  Tabla_PIN = [Y'];
  
  for i=2:numero_nodos
    for j=1:(numero_nodos+1-i)
      Tabla_PIN(j,i) = (Tabla_PIN(j+1,i-1)-Tabla_PIN(j,i-1))/(X(j+(i-1))-X(j));
    endfor
  endfor
  Coeficientes = Tabla_PIN(1,:);
endfunction