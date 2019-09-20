function X = EliminacionGaussiana(M)
  N = size(M,1);
for q=1:N
  for r= q+1: N
    m = M(r,q)/M(q,q);
    M(r,q)=0;
    for c = q+1: N+1
      M(r,c) = M(r,c) - m*M(q,c);
    endfor
  endfor
endfor
X = SustitucionRegresiva(M)
endfunction
