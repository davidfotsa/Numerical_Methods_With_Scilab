//Algorithme Interpolation Langrange 1
funcprot(0);
function a=a(i,X,x)
  a=1;
  for j=1:length(X)
    if (j<>i) then
      a=a*(x-X(j))/(X(i)-X(j));
    end;
  end;
endfunction;
function f=f(X,Y,x)
  f=0;
  for i=1:length(X)
    f=f+a(i,X,x)*Y(i);
  end;
endfunction;
X=2:.1:2.4;
Y=[6,9.0381,12.5856,16.6941,21.4176];
disp(f(X,Y,2.1))
disp(f(X,Y,2.25))
