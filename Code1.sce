funcprot(0)
//disp('Ceci est certainement ton premier code Scilab !'); // Permet d'afficher un texte
//disp("Du courage !");

//Z=zeros(10,5);
//disp(Z);

//U=ones(4,5);
//disp(U);

//x=[2,4,7,9]';
//V=[x.^0,x.^1,x.^2,x.^3];
//disp(V);

x=[2,4,7,9];
y=[20,30,10,60];
z=[x;y];
// Le modèle
function res=F(x1,p1)
    res=p1(1)+p1(2)*x1+p1(3)*x1.^2//+p1(4)*x1.^3;
    //disp(res)
endfunction

//La fonction d'erreur
function e=G(p1,z1)
    e=z1(2)-F(z1(1),p1);
endfunction

p0=[1;2;3];
[p,err]=datafit(G,z,p0);

scf(0);
clf();
plot(x,y,'*-k');
plot(x,F(x,p),'-r');



