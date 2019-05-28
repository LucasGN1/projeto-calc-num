include(joinpath(@__DIR__,"FTCS.jl"))
include(joinpath(@__DIR__,"BTCS.jl"))


u = (x -> sin(pi*x) + 1).(range(0.0, stop=2.0, length=200))
FTCS(2.0e-1, copy(u), 2.0, 0.5, fig_name="FTCSteste1", nt = 10_000) # nt = 10.000 para r < 1/2
BTCS(2.0e-1, copy(u), 2.0, 0.5, fig_name="BTCSteste1")              # aqui nt = 100 por padrao igual a FTCS()


u = (x -> sin(pi*x)).(range(0.0, stop=1.0, length=100))
FTCS(2.0e-1, copy(u), 2.0, 1.5, fig_name="FTCSteste2", nt=10_000)   # nt = 10.000 para r < 1/2
BTCS(2.0e-1, copy(u), 2.0, 1.5, fig_name="BTCSteste2")              # aqui nt = 100 por padrao igual a FTCS()
