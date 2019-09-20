function X = SustitucionRegresivaU(M)% Se recibe una matriz

% Vector donde se guarda el valor encontrado de cada incognita
X = []; 

% Se itera sobre cada fila para hallar la incognita correspondiente
for k=size(M,1):-1:1
  
 % Terminos de la fila k que se usaran para despejar la incognita
 TerminosFilak = M(k,(k+1):(size(M,2)-1)); 
 
 % Se obtiene el termino correspondiente a la incognita de la fila k (akk)
 TerminoIncognita = M(k,k);  
 
 % Al leer la matriz, la ultima columna representa B en la formula AX=B
 % Se obtiene Bk
 Bk = M(k,size(M,2));
 
 % Se despeja la incognita k con la formula explicada
 Xk = (Bk-sum(X.*TerminosFilak))/ TerminoIncognita;
 
 % Se incluye en el vector de incognitas encontradas el nuevo termino
 X = [Xk X];
endfor
