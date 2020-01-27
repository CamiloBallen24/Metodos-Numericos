function R = RungeKutta(p,q,r,t0,x0,y0,h,M)
  
    #Se definen las funciones g y d del sistema de ecuciones de orden superior  
    f=inline('y','t','x','y');
    g=inline('p(t)*y+q(t)*x+r(t)','t','x','y');
    
    #Se definen los valores inicial
    tk=t0;
    xk=x0;
    yk=y0;
    
    #Se crea el arreeglo que guardara las soluciones
    X=[xk];
    
    #Se realiza el proceso iterativo RungeKutta M veces
    for i=0:M
      
      #Se calcula f1 y g1 a partir de los valores anteriores
      f1 = f(tk,xk,yk);
      g1 = g(tk,xk,yk);
      
      #Se calcula f2 y g2 a partir de los valores anteriores y de f1 y g1
      f2 = f(tk+h/2,xk+h/2*f1,yk+h/2*g1);
      g2 = g(tk+h/2,xk+h/2*f1,yk+h/2*g1);
      
      #Se calcula f3 y g3 a partir de los valores anteriores y de f2 y g2
      f3 = f(tk+h/2,xk+h/2*f2,yk+h/2*g2);
      g3 = g(tk+h/2,xk+h/2*f2,yk+h/2*g2);
      
      #Se calcula f4 y g4 a partir de los valores anteriores y de f3 y g3
      f4 = f(tk+h,xk+h*f3,yk+h*g3);
      g4 = g(tk+h,xk+h*f3,yk+h*g3);
      
      
      #Con los valores de f1, f2, f3, f4, g1, g2, g3, g4 y los valores anteriores
      #Se calculo tk, xk y yk
      tk = tk+h;
      xk = xk+((h*(f1+2*f2+2*f3+f4))/6);
      yk = yk+((h*(g1+2*g2+2*g3+g4))/6);
      
      #El unico valor relevante es xk, este se guarda y los demas solo serviran
      #para la proxima iteracion pero no para el resultado
      X=[X xk];
    endfor
    
    #Se retorna el arreglo que contiene los valores solucion
    R = X;
endfunction