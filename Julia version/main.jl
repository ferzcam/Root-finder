include("generatePatterns.jl")
include("adaline.jl")
include("plot_poly.jl")

p(x) = x^2 -3x + 1
poly = [1,-3,1]

#falta definir hiperparametros
patterns_values = WgeneratePatterns(poly,100)
weights = adaline(patterns_values,4)

plot_poly(p,patterns_values,weights, 3)