//Algorithme Interpolation Aitken croissante
funcprot(0);
function f=f(X,Y,x)
  //A=sparse(zeros(length(X),length(X)));
  n=length(X);
  A=zeros(n,n);
  for j=1:n
    for i=1:n-j+1
      if (j==1) then
        A(i,j)=Y(n-i+1);
      else
        A(i,j)=((x-X(n-i-j+2))*A(i,j-1)-(x-X(n-i+1))*A(i+1,j-1))/(X(n-i+1)-X(n-i-j+2));
      end;
    end;
  end;
  disp(A);
  f=A(1,n);
endfunction;
X=-3:1:3;
Y=[2.3,1.6,.7,0,.7,1.6,2.3];
disp(f(X,Y,-2))
disp(f(X,Y,4))
