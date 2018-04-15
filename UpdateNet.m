function W=UpdateNet(W,LR,Input,Target,Output,p)
delta=LR*(Target-((Output>0)*2-1))*Input;
W(:,p)= W(:,p)+delta';