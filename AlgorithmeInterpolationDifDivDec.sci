//Algorithme Interpolation Newton differences divisees decroissantes 
funcprot(0);

function a=a(i,k,X,x)
  a=1;
  n=length(X);
  for j=1:k
    if (n-k+j<>i) then
      a=a*(x-X(n-k+j));
    end;
  end;
endfunction;

function p=p(X,k,x)
  p=1;
  n=length(X);
  for i=1:k
      p=p*(x-X(n-k+i));
  end;
endfunction;

function d=difdivreg(X,Y,k)
  d=0;
  n=length(X);
  for i=1:k
    d=d+Y(n-k+i)/a(n-k+i,k,X,X(n-k+i));
  end;
endfunction;


function f=f(X,Y,x)
  n=length(Y);
  f=Y(n);
  for k=2:n
    f=f+difdivreg(X,Y,k)*p(X,k-1,x)
  end;
endfunction;

X=-2:2;
Y=X;
disp(f(X,Y,2));
