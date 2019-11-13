% Se leen los datos
data = load('data.txt');
% Se guardas los datos en arreglos
x = data(:,1);
N = length(x);
y = data(:,2);
x2 = x.*x;
xy = x.*y;
% se suman obtiene los datos proveniente de la suman y multiplicacion de X,Y
X = sum(x);
Y = sum(y);
X2 = sum(x2);
XY = sum(xy);
%Se imprimen todos los datos en una tabla
printf("------------------------------------------------------------------------\n");  
printf("%15s %15s %15s  %15s \n","X","Y","X2","Y2");
printf("------------------------------------------------------------------------\n");
for i=1:N
  printf("%15d %15d %15d  %15d \n",x(i),y(i),x2(i),xy(i));
endfor
printf("------------------------------------------------------------------------\n");
  printf("%15d %15d %15d  %15d \n\n",X,Y,X2,XY);
%Se crea el sistema de ecuaciones
SE =  [X2 X;X N];
S = [XY; Y];
%Se soluciona el sistema de ecuaciones
sol =linsolve(SE,S);
function val=f(parametros,x)
  val=parametros(1)*x+parametros(2);
endfunction
%Se imprimen los resultados
printf("A = ");
printf("%d \n",sol(1));
printf("B = ");
printf("%d \n",sol(2));
%Se grafica
plot(x,y,'*-r');
xlabel ("X");
ylabel ("Y");
hold on;
title ("Recta de regresión");
plot(x,f(sol,x));
legend("Datos Recibidos","Recta Aproximada");


