"""
    #Explicação
    
"""
function BTCS(α::Float64, u::Vector; L = 1.0, tmax = 1.0)
    n = size(Vector)
    A = zeros(n, n)
    dx = L/(n-1)
    dt = tmax/(n-1)
    ai = -α/dx^2
    bi = 1/dt + 2*α/dx^2
    v = [ai bi ai]
    num = 1/dt
    for i = 2:(n-1)
        for j = 1:3
            A[i, j+i-2] = v[j]
        end
    end
    A[1, 1] = 1.0
    A[n, n] = 1.0

    for t = 1:(n-1)
        b = copy(u)
        for i = 2:(n-1)
            b[i] = num*b[i]
        end
        u = A\b
        #Plotar?
    end
