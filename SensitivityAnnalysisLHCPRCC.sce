funcprot(0);
clc();
clear();

Parameter=["$\Pi$","$v$","$w$","$p$","$q$","$\alpha_{1}$","$\alpha_{2}$","$\beta_{I}$","$\beta_{P}$","$\sigma$","$\mu$","$\mu_{P}$","$\delta$","$\phi$","$\tau$","$\eta$"];
//disp(Parameter)

n=size(Parameter)(2)
Range=ones(n,2);
Range(:,1)=ones(n,1)*10^(-2);
Range(:,2)=ones(n,1);
Range(2,:)=[10^(-5),8*10^(-2)];
Range(5,:)=[10^(-2),0.99];
Range($-1,:)=[1/30,1/4];
Range($,:)=[1/20,1/10];
//disp(Range)

function res=R0(X)
    So=X(1)*(X(11)*X(4)+X(3)*(X(4)+X(5)))/(X(11)*(X(11)+X(2)+X(3)));
    Vo=X(1)*(X(11)*X(5)+X(2)*(X(4)+X(5)))/(X(11)*(X(11)+X(2)+X(3)));
    RoH=X(8)*X(14)*(So+Vo)/((X(13)+X(11)+X(15))*(X(11)+X(14)));
    RoP=X(9)*X(14)*X(16)*So/(X(12)*(X(13)+X(11)+X(15))*(X(11)+X(14)));
    res=0.5*(RoH+sqrt((RoH)^2+4*RoP));
endfunction
//disp(R0(ones(16,1)))

function res=Rang(X)
    res=zeros(length(X),1);
    for i=1:length(X)
        res(i)=1+length(find(X<X(i)))
    end
endfunction
//disp(Rang([4,3,3,2]))

m=10000;
Mat=zeros(m,n+1);
for i=1:n
    Mat(:,i)=grand(m, 1, "unf", Range(i,1), Range(i,2));
end
for i=1:m
    Mat(i,n+1)=R0(Mat(i,:));
end
for i=1:n+1
    Mat(:,i)=Rang(Mat(:,i));
end
PRCC=zeros(n,1);
for i=1:n
    PRCC(i)=correl(Mat(:,i),Mat(:,n+1));
end
//disp(PRCC)

scf(1)
clf(1)
bar(PRCC,1,'blue')
aa=gca();
aa.box="off";
//aa.data_bounds=[0,0;10,10];
aa.children.children.thickness=3;
aa.x_ticks.labels =Parameter';
axx=gda();
axx.title.font_size =4;
axx.x_label.font_size = 4;
axx.y_label.font_size = 4;

xlabel('Parameters');
xtitle("$\text{Sensitivity to } R_{0}$");
