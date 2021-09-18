//Integration par la méthode des trapèzes
x=-2:1:3;
y=[1.6,.7,0,.7,1.6,2.3];

function I=IntTrap(x,y)
    n=length(x);
    I=0;
    if n>2 then
        for i=1:n-1
        I=I+(y(i+1)+y(i))*(x(i+1)-x(i));
        end
    end
    I=I/2;
endfunction
disp(IntTrap(x,y));

