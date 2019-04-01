%Madaline
clear;
clc;
close ALL;
%f = [1 0 -1];  %funcion a evaluar
%f = [1 0 -1];  %funcion a evaluar
%f = [1 -6 11 -6];
%f = [1 0 -1 0];
%f = [1 0 -5 0 4];
f = [1 -1.5 -5 7.5 4 -6];
ejes=[-3, 10, -2, 3]; %ejes para las graficas
LR=0.1;   %learning rate
n=1; %numero de nueronas
ParametroCambio = 0.5; %parametro para la funcion de desatasque


GeneratePatterns(f)
load PatronesPolinomio;
[Input,Target]=PrepararDatos(Data);  %Separa los Datos en Input y Target
W=PerceptronWeigthsGenerator(n);     %Genera los pesos iniciales
Epoc=1;
MaxEpoc=40;
Energy=[EnergiaTotal(Input,Target,W)];  %Lista que almacena las energias para luego ser graficadas

while ~CheckPattern(Input,Target,W) && Epoc<MaxEpoc
    %Guardo la energia para saber si se ha estancado, si la energia
    %permanece constante durante una epoca esta estancada
    EnergiaAnterior=EnergiaTotal(Input,Target,W);
    %itero a traves de todos los patrones (p)
    for p=1:size(Input,1)  
        %todas estas funciones se encargan de graficar
        %----------------------------------------------
        GrapNeuron(W,1)                                                    
        GrapDatos(Input,Target,f,p,1,ejes)                                 
        Real=mode((((Input*W)>=0)*2-1),2);                                 
        GrapNeuron(W,2)                                                    
        GrapDatos(Input,Real,f,p,2,ejes)                                   
        GrapEnergy(Energy,size(Input,1)*MaxEpoc)
        drawnow
        %----------------------------------------------
        
        %calculo el output de un patron y si esque es incorrecto muevo una
        %neurona
        Output=Input(p,:)*W;
        if mode(Output,2)~=Target(p)
            %cambio todos los pesos de cada neurona y me quedo con el
            %cambio que produzca la minima energia 
            W_anterior=W;
            Min=[0 EnergiaTotal(Input,Target,W)];
            for n=1:size(W,2)
                W=UpdateNet(W,LR,Input(p,:),Target(p),Output(n),n);
                if EnergiaTotal(Input,Target,W)<=Min(2)
                    Min=[n EnergiaTotal(Input,Target,W)];
                end
                W=W_anterior;
            end
            %Min[] ahora posee la neurona con la minima energia
            %uso esta neurona para cambiar los pesos 
            if Min(1)~=0
                n=Min(1);
                W=UpdateNet(W,LR,Input(p,:),Target(p),Output(n),n);
            end
        end
        %guardo las energias para graficar
        Energy=[Energy EnergiaTotal(Input,Target,W)];
    end
    %si la energia se ha estancado la desestanco 
    if(EnergiaAnterior==EnergiaTotal(Input,Target,W))
         W=QuitarMin(W,ParametroCambio);
    end
    Epoc=Epoc+1;
end
