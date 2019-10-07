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
#Con ayuda de la funcion f(la que se quiere aproximar) se calcular las ordenadas
#y se guardan en al vector Y
Y = f(nodos);

#Se establece el numero de nodos con el cual se va a trabajar
N = num_nodos;

#Se configura la libreria symbolic para decirle que x sera la variable
x=sym('x');

#Se inicializa el polinomio
PN=0;

#Se muestran los coeficientes con los que se trabajara
printf("Coeficientes ");
Y

#Se ejecuta un ciclo N(numero de nodos) veces, este proceso iterativo 
#ayudara a que todos los nodos ayuden a crear el Polinomio
for i=1:N
  #Se inicializa la variable Li que almacenara el Polinomio Coefiente de Lagrange
  #Para el nodo i decir ==> L[N,i](x)
  Li=1;
  
  #Si Itera N(numero de nodos) veces para construir el PCL L[N,i](x)
  for j=1:N
    #Cuando el nodo i sea igual al nodo j se omite el proceso como lo indica el 
    #metodo de no hacerlo se estaria causando una indeterminacion
    if i~=j
      #Se contruye la parte de PCL L[N,i](x) que involucra al nodo j y se almacena
      #en la variable junta a las partes que ya se hallaron
      Li= Li* (x-vpa(nodos(j)))/(vpa(nodos(i))-vpa(nodos(j)));
    endif
  endfor
  #Se muestra el PCL L[N,i](x)
  printf("Parte del Polinomio L%d      ",i-1);
  Li
  printf("\n");
  
  #Se se multiplica el coeficiente i y el PCL L[N,i](x), se anade esta parte al
  #Polinomio Interpolador de Lagrange
  PN = PN + vpa(Y(i))*Li; 
endfor

#Una vez se contruya el Polinomio Interpolador de Lagrange se imprime
printf("El polinomio aproximado es: \n");
PN

#Usando las herramientas proveidas por symbolic se evalua el Polinomio 
#Interpolador de Lagrange en la x que se quiere aproximar
x=aproximacion;
printf("La aproximacion obtenida es:");
subs(PN)

#Se definen los vectores que mostraran los datos en la grafica
w = linspace(0,2*pi,100);
w_pol = linspace(nodos(1),nodos(length(nodos)),100);

#Se define el Polinomio Interpolador de Lagrange como la funcion aproximadad
funcion_aprox= function_handle(PN)

#Se grafica tanto el Polinomio Interpolador de Lagrange como la funcion original
plot(w,f(w),"r-",w_pol,funcion_aprox(w_pol),"b-");
legend('Original','Aproximacion');

















