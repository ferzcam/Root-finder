function W=UpdateNet(W,LR,Input,Target,Output,p)
delta=LR*(Target-Output)*Input;
W(:,p)= W(:,p)+delta';