using Plots
gr()

function BTCS(α::Float64, u::Vector, L::Float64, tmax::Float64; nt = 100, fig_name="Ibagem")
    n = size(u)[1]
    A = zeros(n, n)
    dx = L/(n-1)
    dt = tmax/nt

    ai = -α/dx^2
    bi = 1/dt + 2*α/dx^2
    v = [ai bi ai]
    for i = 2:(n-1)
        for j = 1:3
            A[i, j+i-2] = v[j]
        end
    end
    A[1, 1] = 1.0
    A[n, n] = 1.0

    d = range(0.0, stop=L, length=n)
    umin = minimum(u)
    umax = maximum(u)
    t = 0.0
    plot(d, u, label="t = $(round(t, digits=4))")
    ylims!(umin, umax)
    p2, p3 = div(nt, 4), div(nt, 2)

    c = 1/dt
    for m = 1:nt
        b = copy(u)
        for i = 2:(n-1)
            b[i] = c*b[i]
        end
        u = A\b
        t = t + dt
        if m == p2 || m == p3 || m == 3*p2 || m == nt
            plot!(d, u, label="t = $(round(t, digits=4))")
            ylims!(umin, umax)
        end
    end
    savefig(fig_name)
end
