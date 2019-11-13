% Se ingresa la funcion correspondiente
while 1
 try
   f = input('ingrese f(x): ','s');
   f = inline(f,'x');
   f(1);% se prueba la funcion
   break;
 catch
   printf("Ingrese una funcion valida \n");
 end_try_catch
endwhile

% Se ingresa el intervalo
printf('Ingrese el intervalo [a,b]\n');
while 1
 try
   a = input('ingrese a: ');
   break;
 catch
   printf("Ingrese una numero\n");
 end_try_catch
endwhile

while 1
 try
   b = input('ingrese b: ');
   break;
 catch
   printf("Ingrese una numero\n");
 end_try_catch
endwhile

% Se ingresa M
while 1
 try
   M = input('ingrese M ');
   break;
 catch
   printf("Ingrese una numero\n");
 end_try_catch
endwhile

Trapecio(f,a,b,M);
Simpson(f,a,b,M);