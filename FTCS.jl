using Plots
gr()

function FTCS(α::Float64, u::Vector, L::Float64, tmax::Float64; nt = 100, fig_name="Ibagem")
    nx = size(u)[1] - 1
    dx = L/nx
    dt = tmax/nt
    r = α*dt/dx^2

    if r >= 0.5
        error("r = $r >= 1/2, solução instável.")
    end

    r2 = 1 - 2*r

    # Para plotar:
    d = range(0.0, stop=L, length=(nx+1))
    umin = minimum(u)
    umax = maximum(u)
    t = 0.0
    plot(d, u, label="t = $(round(t, digits=4))")
    ylims!(umin, umax)
    p2, p3 = div(nt, 4), div(nt, 2)

    for m = 1:nt
        uold = copy(u)
        t = t + dt
        for i = 2:nx
            u[i] = r*uold[i-1] + r2*uold[i] + r*uold[i+1]
        end
        if m == p2 || m == p3 || m == 3*p2 || m == nt
            plot!(d, u, label="t = $(round(t, digits=4))")
            ylims!(umin, umax)
        end
    end
    savefig(fig_name)
end

