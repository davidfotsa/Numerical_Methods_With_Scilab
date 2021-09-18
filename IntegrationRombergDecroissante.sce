//Integration par la méthode de Romberg decroissante
function y=f(x)
    y=exp(1+x.^2);
endfunction;

function I=IntTrap(f,a,b,h)
    I=(f(a)+f(b))/2;
    //h=(b-a)/n;
    x=a:h:b;
    n=length(x);
    if n>2 then
        I=I+sum(f(x(2:n-1)));
    end
    I=I*h;
endfunction

function r=g(X,Y,x)
  //A=sparse(zeros(length(X),length(X)));
  n=length(X);
  A=zeros(n,n);
  for j=1:n
    for i=j:n
      if (j==1) then
        A(i,j)=Y(n-i+1);
      else
        A(i,j)=((x-X(n-i+j))*A(i,j-1)-(x-X(n-i+1))*A(i-1,j-1))/(X(n-i+1)-X(n-i+j));
      end;
    end;
  end;
  disp(A);
  r=A(n,n);
endfunction;

X=[.25,.5,1];
Y=[IntTrap(f,1,2,.25),IntTrap(f,1,2,.5),IntTrap(f,1,2,1)];
disp(g(X,Y,0))
