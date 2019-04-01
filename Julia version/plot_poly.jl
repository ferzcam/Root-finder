using Plots
# using generatePatterns
pyplot()

function divide_patterns(patterns_values)
    #Patterns of class 0 or -1
    patterns_0 = patterns_values[patterns_values[:,3].==-1,1:2]
    x_values_0 = patterns_0[:,1]
    y_values_0 = patterns_0[:,2]

    #Patterns of class 1
    patterns_1 = patterns_values[patterns_values[:,3].==1,1:2]
    x_values_1 = patterns_1[:,1]
    y_values_1 = patterns_1[:,2]

    return x_values_0, y_values_0, x_values_1, y_values_1
end

function plot_poly(p::Function, patterns_values, weights, option::Int)

    x_values_0, y_values_0, x_values_1, y_values_1 = divide_patterns(patterns_values)
    w(x) = -(weights[1]/weights[2])*x - (weights[3]/weights[2])

    if option == 1 #only plot poly
        plot_function = plot(p,label = "Polynomial",lw=3)
        display(plot_function)
    elseif option == 2 #plot poly and patterns
        plot_function = plot(p,label = "Polynomial",lw=3)
        plot_matrix0 = plot!(x_values_0,y_values_0, seriestype=:scatter,label="Patterns 0",lw=3)
        plot_matrix1 = plot!(x_values_1,y_values_1, seriestype=:scatter,label="Patterns 1",lw=3)
        display(plot_matrix1)
    elseif option == 3
        plot_function = plot(p,label = "Polynomial",lw=3)
        plot_matrix0 = plot!(x_values_0,y_values_0, seriestype=:scatter,label="Patterns 0",lw=3)
        plot_matrix1 = plot!(x_values_1,y_values_1, seriestype=:scatter,label="Patterns 1",lw=3)
        plot_weight = plot!(w,label = "Adaline",lw=3)
        display(plot_weight)
    end

    title!("Polynomial")
    xlabel!("X values")
    ylabel!("Y values")
    read(stdin, Char)
end
