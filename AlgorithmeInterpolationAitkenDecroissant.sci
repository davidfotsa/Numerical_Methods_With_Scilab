//Algorithme Interpolation Aitken decroissante
funcprot(0);
function f=f(X,Y,x)
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
  f=A(n,n);
endfunction;
X=-2:2;
Y=X^2-1;
disp(f(X,Y,1))
disp(f(X,Y,2))
