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
% Ingresa el numero de nodos
while 1
  try 
    num_nodos = input('ingrese el numero de nodos a usar: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile
%Ingresa los nodos
nodos = zeros(1,num_nodos);
for i=1:num_nodos
  while 1
    try
      printf("Ingrese el nodo X%d",i-1);
      nodos(i) = input(": ");
      break;
    catch
      printf("Ingrese una numero\n");
    end_try_catch
  endwhile
endfor
% Ingresa el valor de X que se quiere aproximar
while 1
  try 
    aproximacion = input('ingrese el valor de X que quiere aproximar: ');
    break;
  catch
    printf("Ingrese una numero\n");
  end_try_catch
endwhile

%pkg load symbolic
Y = f(nodos);
N = num_nodos;
x=sym('x');
PN=0;
printf("Coeficientes ");
Y
for i=1:N
  Li=1;
    for j=1:N
      if i~=j
        Li= Li* (x-vpa(nodos(j)))/(vpa(nodos(i))-vpa(nodos(j)));
      endif
  endfor
  printf("Parte del Polinomio L%d      ",i-1);
  Li
  printf("\n");
  PN = PN + vpa(Y(i))*Li; 
endfor

printf("El polinomio aproximado es: \n");
PN
x=aproximacion;
printf("La aproximacion obtenida es:");
subs(PN)

w = linspace(0,2*pi,100);
w_pol = linspace(nodos(1),nodos(length(nodos)),100);
funcion_aprox= function_handle(PN)
plot(w,f(w),"r-",w_pol,funcion_aprox(w_pol),"b-");
legend('Original','Aproximacion');

















