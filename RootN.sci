//Résolution de l'équation f(x)=0 par la méthode de Newton
funcprot(0);

function f=f(x)
  //f=x.^2;
  //f=log(x)+3*x-1;
  //f=x^4-5*x^2+6;
  f=x^4-x^2-6;
endfunction

function df=df(x)
  //df=2*x;
  //df=1/.x+3;
  df=4*x^3-2*x;
endfunction

function r=RacineN(a,e)
  //c=a;
  n=0;
  if (f(a)==0) then
    c=a;
  elseif (df(a)==0)
    disp('Mauvaise entrées !')
  else
    c=a-f(a)/df(a);
    n=1;
    while (df(c)~=0)&((abs(c-a)>e))//((abs(f(c))>e))//&(c>0) 
      //c=c-f(c)/df(c);
      a=c;
      c=c-f(c)/df(c);
      n=n+1;
    end;
  end;
  r=[c,n];
endfunction;

//x=0.01:0.01:10;
//x=-10:0.01:10;
x=1.5:0.01:2;
y=f(x);
plot(x,y);
plot(x,zeros(1,length(x)),'k')
//r=RacineN(0.01,0.001);
//r=RacineN(1,0.001);
r=RacineN(1.65,10^(-6));
disp(r)
disp(f(r(1)))
