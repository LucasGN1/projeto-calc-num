using Plots
gr()


"""
    #Inserir explicação

"""
function FTCS(α::Float64, u::Vector, L::Float, tmax::Float; nt = 100)
    nx = size(u) - 1
    dx = L/nx
    dt = tmax/nt
    r = α*dt/dx^2

    if r >= 0.5
        error("r = $r >= 1/2, solução instável.")
    end

    r2 = 1 - 2*r

    d = range(0.0, stop=L, length=(nx+1))
    umin = minimum(u)
    umax = maximum(u)
    t = 0.0
    plot(d, u, label="t = $(round(t, digits=4))")
    ylims!(umin, umax)

    for m = 1:nt
        uold = copy(u)
        t = t + dt
        for i = 2:nx
            u[i] = r*uold[i-1] + r2*uold[i] + r*uold[i+1]
        end
        if t == tmax*(1/4) || t == tmax*(1/2) || t == tmax*(3/4) || t == tmax
            plot!(d, u, label="t = $(round(t, digits=4))")
            ylims!(umin, umax)
        end
    end
    savefig("Ibagem")
end

function main()
    u = (x -> sin(pi*x)).(range(0.0, stop=1.0, length=80))
    FTCS(1.0, u, 1.0, 1.0)
end

main()
