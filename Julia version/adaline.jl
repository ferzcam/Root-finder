function adaline(matriz, hiperparametros)
    generations = 0
    maxGenerations = 10
    pesos = rand(1,3)
    alpha = 0.2

    desiredOutputs = matriz[1,:]
    inputs = vcat(matriz[2:3,:],-ones(1,size(matriz,2)))

    realOutputs = pesos* inputs
    signedOutputs = map(x->sign(x),realOutputs)


    while !(generations > maxGenerations) &&  !(desiredOutputs' == signedOutputs)
        for (i, igual) in enumerate(desiredOutputs .== signedOutputs')
            if !igual
                pesos += alpha*(desiredOutputs[i]-signedOutputs[i])*inputs[:,i]'
            end
        end
        realOutputs = pesos* inputs
        signedOutputs = map(x->sign(x),realOutputs)
        generations += 1
    end
    return pesos 
end 

# matriz = [-1 1 1 1;1 1 2 2; 1 2 1 2]
# println(adaline(matriz,4))