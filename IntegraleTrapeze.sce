//Integration par la méthode des trapèzes
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
disp(IntTrap(f,1,2,1));
disp(IntTrap(f,1,2,.5));
disp(IntTrap(f,1,2,.25));
