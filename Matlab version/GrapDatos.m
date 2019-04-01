function GrapDatos(Input,Target,f,p,plt,ejes)
subplot(1,3,plt);
Input=Input(:,1:2);
x=-5:0.1:5;
y=polyval(f,x);
plot(x,y);hold on;
plot(Input(find(Target==1),1),Input(find(Target==1),2),'gx');hold on;
plot(Input(find(Target==-1),1),Input(find(Target==-1),2),'ro');hold on;
plot(Input(p,1),Input(p,2),'bd');
plot([ejes(1) ejes(2)],[0 0]);hold on;
axis(ejes)

hold off