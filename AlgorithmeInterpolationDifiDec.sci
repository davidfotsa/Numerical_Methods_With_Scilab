//Algorithme Interpolation Newton differences finies decroissantes 
funcprot(0);
function f=factoriel(n)
  f=1;
  if (n>1) then
    for i=2:n
      f=f*i;
    end;
  end;
endfunction;

function c=combinaison(p,n)
  c=0;
  if (p<=n) then
    c=factoriel(n)/(factoriel(p)*factoriel(n-p));
  end;
endfunction;

function d=difireg(Y,i,k)
  d=0;
  for j=0:k
    d=d+((-1)^j)*combinaison(j,k)*Y(i-j);
  end;
endfunction;

function p=p(b,k,h,x)
  p=1;
  for i=1:k
      p=p*(x-b+(i-1)*h);
  end;
endfunction;

function f=f(a,b,Y,x)
  n=length(Y);
  h=(b-a)/(n-1);
  f=Y(n);
  for i=1:n-1
    f=f+difireg(Y,n,i)*p(b,i,h,x)/((h^i)*factoriel(i));
  end;
endfunction;
Y=-2:2;
disp(f(-2,2,Y,3));
