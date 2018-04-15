function bool=CheckPattern(Input,Target,W)
Real=mode((((Input*W)>0)*2-1),2);
if Target==Real
    bool = true;
else 
    bool= false;
end
