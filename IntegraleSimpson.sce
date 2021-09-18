//Integration par la méthode de Simpson
x=-3:1:3;
y=[2.3,1.6,.7,0,.7,1.6,2.3];

function I=IntTrap(x,y)
    n=length(x);
    I=y(1)-y(n);
    if n>2 then
        for i=1:(n-1)/2
        I=I+2*(2*y(2*i)+y(2*i+1));
        end
    end
    I=I/3;
endfunction
disp(IntTrap(x,y));

