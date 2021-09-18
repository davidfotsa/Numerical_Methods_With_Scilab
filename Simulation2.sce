ti=0;// Temps initial
h=0.001; //Pas de temps en années
tf=1; //Temps final de simulation
a1=0*12; // Taux de recrutement de poules
a2=0*0.1; // Taux de recrutement des chiens
r1=10*12/2; // Taux de reproduction des poules
r2=2*3/2; // Taux de reproduction des chiens
d1=5*12+1/5; // Taux de disparition naturel des poules
d2=1/10; // Taux de disparition naturel des chiens
b1=365/(10^12); // Taux de contact adéquat pour prédation
b2=3/(10^12); // Facteur positif de contact avec les proies
c1=r1/100; // Facteur de compétition chez les poules
c2=r2/10; // Facteur de compétition chez les chiens

t=ti:h:tf; // Discrétisation du temps
n=length(t)-1; // n+1 désigne le nombre de temps
x=zeros(1,n+1); // Suite des tailles de population des poules
y=x; // Suite des tailles de population des chiens
x(1)=10;
y(1)=2;
// Itérations de résolution
for i=1:n
    x(i+1)=x(i)+h*(a1+(r1-d1)*x(i)-b1*x(i)*(c1*x(i)+y(i)));
    y(i+1)=y(i)+h*(a2+(r2-d2)*y(i)+b2*y(i)*(x(i)-c2*y(i)));
end
clf();
plot(t,x,'-*b'); // Affichage de la dynamique des proies
plot(t,y,'-*r'); // Affichage de la dynamique des prédateurs
L=legend(["Proies";"Prédateurs"],5)
