//Algorithme Interpolation Newton differences finies croissantes 
funcprot(0);
function f=factoriel(n)
  f=1;
  if (n>1) then
    for i=2:n
      f=f*i;
    end;
  end;
endfunction;

function c=combinaison(k,n)
  c=0;
  if (k<=n) then
    c=factoriel(n)/(factoriel(k)*factoriel(n-k));
  end;
endfunction;

function d=difipro(Y,i,k)
  d=0;
  for j=0:k
    d=d+((-1)^j)*combinaison(j,k)*Y(i+k-j);
  end;
endfunction;

function p=p(a,k,h,x)
  p=1;
  for i=1:k
      p=p*(x-a-(i-1)*h);
  end;
endfunction;

function f=f(a,b,Y,x)
  n=length(Y);
  h=(b-a)/(n-1);
  f=Y(1);
  for i=1:n-1
    f=f+difipro(Y,1,i)*p(a,i,h,x)/((h^i)*factoriel(i));
  end;
endfunction;
Y=(-2:2)^2;
disp(f(-2,2,Y,-1));
