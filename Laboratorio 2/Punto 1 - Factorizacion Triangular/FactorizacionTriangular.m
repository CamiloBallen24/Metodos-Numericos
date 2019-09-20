function X = FactorizacionTriangular(M)
  % Se crean las matrices L y U
  
  % L: matriz que almacena los multiplicadores,se crea inicialmente como una 
  % matriz identidad para tener presente los unos de la diagonal
  L = eye(size(M,2)-1);
  
  % U: Inicia siendo la matriz M pero pasa por el proceso de eliminacion Gaussiana
  U = M(:,1:size(M,2)-1);
 
  % Tamaño de la matriz
  N = size(U,1);
  
  % Vector B proveniente de AX = B
  B = M(:,size(M,2));
  
  for q=1:N % Se ejecuta de acuerdo a la cantidad de filas que halla
    
    for r= q+1: N % Se itera por la columna del pivot  para hacerla ceros
      
      m = U(r,q)/U(q,q); % Se halla el multiplicador
      
      L(r,q)=m; % Se asigna el multiplicador mrq a la matriz L en la posicon rq
      
      U(r,q)=0; % Se coloca el cero correpondiente
      
      for c = q+1: N % Se itera por  la fila q desde la posicon q+1
        
        U(r,c) = U(r,c) - m*U(q,c); % se actualizan los valores despues de usar el multiplicador
        
      endfor
    endfor
  endfor
  
  % Usando el algoritmo de Sustitucion Regresiva se resuelve LY = B
  L = [L B]
  Y = SustitucionRegresivaL(L);
  
  % Usando el algoritmo de Sustitucion Regresiva se resuelve UX = Y
  U = [U Y']
  X = SustitucionRegresivaU(U);
endfunction
