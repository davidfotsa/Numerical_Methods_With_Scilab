//Algorithme Interpolation Langrange 2
funcprot(0);
function v=v(i,X,x)
  v=1;
  for j=1:length(X)
    if (j<>i) then
      v=v*(x-X(j));
    end;
  end;
endfunction;
function vp=vp(X,x)
  vp=0;
  for i=1:length(X)
    vp=vp+v(i,X,x);
  end;
endfunction;
function f=f(X,Y,x)
  f=0;
  for i=1:length(X)
    f=f+v(i,X,x)*Y(i)/vp(X,x);
  end;
endfunction;
