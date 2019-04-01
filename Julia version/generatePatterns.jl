# using Distributions

# using PyPlot
# using PyCall

# pylab = pyimport("pylab")
        


dy = 0.2

function evalPoly(poly, x)
    fx = 0;
    for i = 1:length(poly)
        fx = fx + poly[i] * x^(i-1)
    end
    return fx
end

function gershgorin(poly)

    monic = map(x -> x/poly[end], poly)
    init = map(abs, monic[1:end-2]);
    max = maximum(init)
    last = poly[end-1] * (-1)
    if last<0
        if last+1 < -max #disconnected
            return [(last-1, last+1),(-max, max)]
        else #connected
            return [(min(last-1, -max), max)]
        end
    else
        if last-1 > max #disconnected
            return [(last-1, last+1),(-max, max)]
        else #connected
            return [(-max,max(last+1, max))]
        end
    end
end            


function generatePatterns(poly, interval, n) #just for one region
    limInf = interval[1]
    limSup = interval[2]
    dx = (limSup-limInf)/(n-1)
    patterns = [0.0 0.0 0.0]
    counter = 1
    x = limInf
    for i = 1:n
        y = rand()*2*dy - dy
        
        if y > evalPoly(poly, x)

            entry = [x y 1.0] #above function
        else 
            entry = [x y -1.0] #below function
        end
        x = x + dx
        patterns = vcat(patterns,  entry)
    end
    return patterns
end

function WgeneratePatterns(poly, n) #n stands for number of points
    intervals = gershgorin(poly)
    if length(intervals) == 2 
        s = n/(length(poly)-1)
        first = generatePatterns(poly,intervals[1], s)
        second = generatePatterns(poly, intervals[2], n-s)
        final = vcat(first, second)

    else
        final = generatePatterns(poly,intervals[1], n)
    end
    return final
end




# poly = [1,-3,1]
# intervals = gershgorin(poly)
# println(intervals)

# if length(intervals) == 2
#     limitsPlot = (min(intervals[1][1], intervals[2][1]) , max(intervals[1][2], intervals[2][2]))
# else
#     limitsPlot = intervals[1]
# end

# a = WgeneratePatterns(poly, intervals, 100)
# x = range(limitsPlot[1],stop=limitsPlot[2],length=1000)
# y = 1 .- 3 .* x+ x.^2
# pylab.plot(x, y, color="red", linewidth=2.0, linestyle="--")
# pylab.show()

# scatter(a[:,1], a[:,2], s= 20, c = "b", marker='o')


