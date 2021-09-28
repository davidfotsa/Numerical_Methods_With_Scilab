
function u=prey(x,y)
    u=10 + 4*x -(x^2) - 2*x*y; //equation for prey
endfunction
function v=pred(x,y)
    v=1 + y - (y^2) + 4*x*y;//equation for predator
endfunction
h=0.01; //le pas
u=10;  //total time i.e t[0,10]
d=(u/h);  
t=zeros(1,d+1);
x=zeros(1,d+1);
y=zeros(1,d+1);
t(1)=0;
x(1)=50;
y(1)=10;
for i=1:d
   t(i+1)=t(i)+ h;
   x(i+1)=x(i)+ h*prey(x(i),y(i));
   y(i+1)=y(i)+ h*pred(x(i),y(i));
end
plot(t,x,'r',t,y,'b') //PREY IN RED & PREDATOR IN BLUE.

//ODE
function u=f(t, y)
    u(1)=10 + 4*y(1) -(y(1)^2) - 2*y(1)*y(2); //EQUATION FOR PREY
    u(2)=1 + y(2) - (y(2)^2) + 4*y(1)*y(2);//EQUATION FOR PREDATOR
    u=[u(1) u(2)];
endfunction
y0=[50;10];
t0=0;
t=0:0.01:10
y=ode(y0,t0,t,f)
plot(t,y)
ylabel('prey & predator')
xlabel('time')
legend(['prey';'predator'])



