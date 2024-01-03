function [x,xN,n] = gradientConjugue2 (A,b,x0,tol,Nmax,solution)
  g = A*x0-b;
  d = -g;
  x(:,1) = x0;
  n = 1;
  gg = g'*g;

  while norm(x(:,n)-solution)>tol && n<Nmax
    Ad = A*d;
    rho = gg/(d'*Ad);
    x(:,n+1) = x(:,n) + rho*d;
    g = g + rho.*Ad;
    ggtemp = g'*g;
    beta = ggtemp/gg;
    gg = ggtemp;
    d = -g+beta*d;
    n = n+1;

  end
  xN = x(:,end);
end
