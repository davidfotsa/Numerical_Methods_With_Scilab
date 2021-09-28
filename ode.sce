a=5;
b=3;
c=1;
function y=f(t,x)
    y=a*x-(b*x)-(c*(x^2));
endfunction
x0=10;
t0=0;
t=0:0.01:10;
y = ode(x0,t0,t,f);
plot(t,y,)
xlabel('time')
ylabel('population')
