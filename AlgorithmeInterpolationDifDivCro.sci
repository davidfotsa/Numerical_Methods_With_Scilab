//Algorithme Interpolation Newton differences divisees croissantes 
funcprot(0);

function a=a(i,k,X,x)
  a=1;
  for j=1:k
    if (j<>i) then
      a=a*(x-X(j));
    end;
  end;
endfunction;

function p=p(X,k,x)
  p=1;
  for i=1:k
      p=p*(x-X(i));
  end;
endfunction;

function d=difdiv(X,Y,k)
  d=0;
  for i=1:k
    d=d+Y(i)/a(i,k,X,X(i));
  end;
endfunction;


function f=f(X,Y,x)
  n=length(Y);
  f=Y(1);
  for k=2:n
    f=f+difdiv(X,Y,k)*p(X,k-1,x)
  end;
endfunction;

X=-2:2;
Y=X;
disp(f(X,Y,2));
