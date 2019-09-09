function c =biseccionBolzano(f,a,b,fx,aprox,iter)
  i=0;
  c=(a+b)/2;
  printf("--------------------------------------------------------------------------------------------------------------------\n");  
  printf("%15s %15s %15s %15s %15s %15s %15s \n","i","Extremo izq(a)","Punto medio(c)","Extremo der(b)","f(a)","f(c)","f(b)");
  printf("--------------------------------------------------------------------------------------------------------------------\n");  
  while (i<iter) && (abs(fx-f(c)) > aprox)
    c = (a+b)/2;
    % se mueve la funcion verticalmente para que halla cambio de signo en f(x)
    fa = f(a)-fx;
    fb = f(b)-fx;
    fc = f(c)-fx;
    if f(c) == fx %si f(c) = f(x) se rompe el ciclo
      break;
    endif
    if sign(fc) == sign(fb) % se reasigna c de acuerdo al signo
      b=c;
    else
      a=c;
    endif
    i=i+1;
    printf("%15d %15d %15d %15d %15d %15d %15d \n",i,a,c,b,fa,fc,fb);
  endwhile
endfunction