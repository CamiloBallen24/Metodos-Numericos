% Se cargan los datos
M = load('MatrizPunto1.txt');

% Se corre la el Metodo
X = FactorizacionTriangular(M);

% Se ilustran los resultados
disp("Solucion sistema de ecuaciones:");

for i=1:size(X,2)

  printf("X%d: %d     ",i,X(i));
endfor