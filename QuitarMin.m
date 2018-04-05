function W=QuitarMin(W,ParametroCambio)
    W = W + ParametroCambio*rand(size(W,1),size(W,2));
    disp('La energia se atasco y la funcion de desatasque fue aplicada')
end