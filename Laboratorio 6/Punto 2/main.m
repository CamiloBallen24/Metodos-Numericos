% Se ingresa la funcion por partes 

while 1
  try
    original = input('ingrese la funcion exacta ','s');
    original = inline(original,'x');
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile
while 1
  try
    p = input('ingrese p(t): ','s');
    p = inline(p,'x');
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile

while 1
  try
    q = input('ingrese q(t): ','s');
    q = inline(q,'x');
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile

while 1
  try
    r = input('ingrese r(t): ','s');
    r = inline(r,'x');
    break;
  catch
    printf("Ingrese una funcion valida \n");
  end_try_catch
endwhile


#Se Ingresa el intervalo
while(true)
  try 
    a = input("Ingrese el valor de a: ");
    a = a+2-2; #se prueba que es un numero
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 

while(true)
  try 
    b = input("Ingrese el valor de b: ");
    b = b+2-2; #se prueba que es un numero
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Se Ingresa los valores alpha y beta
while(true)
  try 
    alpha = input("Ingrese el valor alpha x(a): ");
    alpha = alpha+2-2; #se prueba que es un numero
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 
while(true)
  try 
    beta = input("Ingrese el valor beta x(b): ");
    beta = beta+2-2; #se prueba que es un numero
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 


#Se Ingresa el valor h
while(true)
  try 
    h = input("Ingrese el valor de h: ");
    h = h+2-2; #se prueba que es un numero
    break;
  catch
    printf("Favor ingresar un valor apropiado\n");
  end_try_catch
endwhile 



#Llamada a la funcion que calcula el vector X
X  = DiferenciasFinitas(p,q,r,a,b,h,alpha,beta);

# se crean los valores de t para la tabla y grafica
t = [a+h:h:b]';

# se evalua t en la funcion original y se calcula el error con respecto a X
sol_Exacta=[];
error= [];
for i=1:size(t)
  sol_Exacta(i)=original(t(i));
  error(i) = sol_Exacta(i)-X(i);
endfor

# Se muestran los datos en la tabla correspondiente
format short
  printf("  ________________________________________________________\n");
  printf("  |    tj   |      xj      |     x(tj)    |   x(tj)-xj   |\n");
  printf("  |---------|--------------|--------------|--------------|\n");
  printf("  | %5d   | %10d   | %10d   | %10d   |\n\n",a,alpha,alpha,0);
  for i=1: size(t)
     printf("  | %5d   | %10d   | %10d   | %10d   |\n\n",t(i),X(i),sol_Exacta(i),error(i));
   endfor
  printf("  | %5d   | %10d   | %10d   | %10d   |\n\n",b,beta,beta,0);

  
# se grafica la aproximacion
plot(t,X,'*-r');
xlabel ("t");
ylabel ("X");
title ("Comparación solución aproximada y función original");

hold on;
# Se grafica la funcion original
fplot(original,[0,b]);
legend("Aproximación","Función Original");















