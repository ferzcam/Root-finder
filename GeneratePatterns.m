function GeneratePatterns(f)
Xlim=6;
Ylim=0.1;
NumPat=40;
m = matfile('PatronesPolinomio.mat','Writable',true);

Pat=rand([NumPat, 3]); % NumPat*3
Pat(:,1)=(Pat(:,1)*2*Xlim)-Xlim; % 
Pat(:,2)=(Pat(:,2)*2*Ylim)-Ylim; %

Func=polyval(f,Pat(:,1));

Pat(:,3)=(Func(:,1)<Pat(:,2))*2-1;

m.Data = Pat; % ingresar los patrones aleatorios al .mat 
end