function energias=EnergiaTotal(Input,target,W)
diferencia=target-mode((Input*W>=0)*2-1,2);
energias=0.5*(diferencia'*diferencia);
