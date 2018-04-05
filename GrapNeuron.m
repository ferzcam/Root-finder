function GrapNeuron(W,plt)
    subplot(1,3,plt);
    x=-10:1:10;

for i=1:size(W,2)
    w1=W(1,i);
    w2=W(2,i);
    w3=W(3,i);
    y=(w3-(w1.*x))./w2;
    plot(x,y)
    hold on
end

 



