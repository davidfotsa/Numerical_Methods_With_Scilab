r=3; // Taux de reproduction
d=1; // Taux de mortalité
h=0.01; // Pas de temps
t=0:h:10; // Vecteur des temps discrets
n=length(t)-1; // n+1 vaut le nombre de temps discrets
x=zeros(1,n+1); // Génération d'un vecteur nul
x(1)=10; // Condition initiale
for i=1:n //Boucle de calcul itératif
    x(i+1)=(1+h*(r-d))*x(i); // Schéma numérique
end //Fin de la boucle
clf();
plot(t,x,'*r'); // Affichage de la solution approchée
plot(t,x(1)*exp((r-d)*t),'-b'); // Affichage de la solution exacte
L=legend(['Solution approchée';'Solution exacte']) // Ajout de la légende

