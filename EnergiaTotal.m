function energias=EnergiaTotal(Input,target,W)
diferencia=target-mode((Input*W),2);
energias=0.5*(diferencia'*diferencia);
