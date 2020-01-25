function R = RungeKutta(p,q,r,t0,x0,y0,h,M)
  
    f=inline('y','t','x','y');
    g=inline('p(t)*y+q(t)*x+r(t)','t','x','y');
    
    tk=t0;
    xk=x0;
    yk=y0;
    
    X=[xk];
    
    for i=0:M
      f1 = f(tk,xk,yk);
      g1 = g(tk,xk,yk);
      
      f2 = f(tk+h/2,xk+h/2*f1,yk+h/2*g1);
      g2 = g(tk+h/2,xk+h/2*f1,yk+h/2*g1);
      
      f3 = f(tk+h/2,xk+h/2*f2,yk+h/2*g2);
      g3 = g(tk+h/2,xk+h/2*f2,yk+h/2*g2);
      
      f4 = f(tk+h,xk+h*f3,yk+h*g3);
      g4 = g(tk+h,xk+h*f3,yk+h*g3);
      
      tk = tk+h;
      xk = xk+((h*(f1+2*f2+2*f3+f4))/6);
      yk = yk+((h*(g1+2*g2+2*g3+g4))/6);
      
      X=[X xk];
    endfor
    R = X;
endfunction