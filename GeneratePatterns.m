function GeneratePatterns(f)
Xlim=6;
Ylim=0.1;
NumPat=100;
NumRows = 4;
m = matfile('PatronesPolinomio.mat','Writable',true);

% ratioX = 2*Xlim/NumPat;
% ratioY = 2*Ylim/NumRows;
% 
% pointsX = [-Xlim:ratioX:Xlim]';
% pointsY = [-Ylim:ratioY:Ylim]';
% 
% realNumPats = size(pointsX,1);
% realNumRows = size(pointsY,1);
% 
% 
% Pat = zeros([realNumPats*realNumRows,3]);
% Pat(:,1) = repmat(pointsX,realNumRows,1);
% 
% pPointsY = kron(pointsY, ones(realNumPats,1));
% ppPointsY = reshape(pPointsY,1,size(pPointsY,1)*size(pPointsY,2));
% Pat(:,2) = ppPointsY;
% 
Pat=rand([NumPat*NumRows, 3]); % NumPat*3
Pat(:,1)=(Pat(:,1)*2*Xlim)-Xlim; % 
Pat(:,2)=(Pat(:,2)*2*Ylim)-Ylim; %

Func=polyval(f,Pat(:,1));

Pat(:,3)=(Func(:,1)<Pat(:,2))*2-1;

m.Data = Pat; % ingresar los patrones aleatorios al .mat 
end