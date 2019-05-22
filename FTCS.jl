#using Plots
#gr()

#=

L = 1.0                         # Tamanho da barra
tmax = 2.0                      # Tempo final
nx = 100                        # Número de intervalos de x
nt = 500                        # Número de intervalos de t
dx = L/nx
dt = tmax/nt
α = 1.0e-2                      # Coeficiente de difusão térmica
r = α*dt/dx^2                   # r < 1/2 para funcionar

if r >= 0.5
    error("r muito grande")
end

r2 = 1 - 2*r

d = range(0.0, stop=L, length=(nx+1))
u = (x -> sin(pi*x)).(d)
umin = minimum(u)
umax = maximum(u)
global t = 0.0

for m = 1:nt
    plot(d, u, title="t = $(round(t, digits=4))", leg=false)
    ylims!(umin, umax)
    savefig("$m")
    uold = copy(u)
    global t = t + dt
    for i = 2:nx
        u[i] = r*uold[i-1] + r2*uold[i] + r*uold[i+1]
    end
end

=#




#=
using Plots
gr()
=#

"""
    #Inserir explicação

"""
function FTCS(α::Float64, u::Vector;nx = 100, nt = 100, L = 1.0, tmax = 1.0)
    dx = L/nx
    dt = tmax/nt
    r = α*dt/dx^2
    #=
    if r >= 0.5
        error("r = $r >= 1/2, solução instável")
    end
    =#
    r2 = 1 - 2*r
    #d = range(0.0, stop=L, length=(nx+1))

    #=
    umin = minimum(u)
    umax = maximum(u)
    global t = 0.0
    =#

    for m = 1:nt
        #=
        plot(d, u, title="t = $(round(t, digits=4))", leg=false)
        ylims!(umin, umax)
        savefig("$m")
        =#
        uold = copy(u)
        #global t = t + dt
        for i = 2:nx
            u[i] = r*uold[i-1] + r2*uold[i] + r*uold[i+1]
        end
    end
