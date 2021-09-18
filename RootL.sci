//Résolution de l'équation f(x)=0 par la méthode de Lagrange
funcprot(0);

function f=f(x)
  //f=x.^2;
  //f=log(x)+3*x-1;
  //f=x^4-5*x^2+6;
  //f=10*log(sin(x^2+%pi)+2)-6;
  f=x^4-x^2-6;
endfunction

function r=RacineL(a,b,e)
  c=a;
  n=0;
  if (f(a)==0) then
    c=a;
  elseif (f(b)==0)
    c=b;
  elseif (f(a)==f(b))
   disp('Mauvaise entrées !')
  else
    c=b-f(b)*(b-a)/(f(b)-f(a));
    n=1;
    disp([c,n])
    while (n<5)&(f(a)<>f(b))// (abs(a-b)>e) //((abs(f(c))>e))&(f(a)<>f(b))
      //if (f(c)*f(b)<0) then//|(abs((f(b)-f(c))/(b-c))>abs((f(a)-f(c))/(a-c)))
        a=b;
      //end;
      b=c;
      c=b-f(b)*(b-a)/(f(b)-f(a));
      n=n+1;
      disp([c,n])
    end;
  end;
  r=[c,n];
endfunction;

//x=0.01:0.01:10;
//x=-10:0.01:10;
x=-1:0.01:2;
y=f(x);
plot(x,y);
plot(x,zeros(1,length(x)),'k')
//r=RacineL(0.01,1,0.001);
//r=RacineL(0.05,1,0.001);
//r=RacineL(0.6,1,10^(0));
r=RacineL(1.5,1.6,0.07);
disp(r)
disp(f(r(1)))
    
