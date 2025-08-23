using Printf

const N = 3
const ε = 0.0001

a = hcat([
    2.0 1.0 3.0
    1.0 3.0 2.0
    3.0 2.0 1.0
], zeros(N,2N) )

for y=1:N
    for x=1:N
        a[y, x] = a[y,x]
    end
    a[y, y+N] = 1.0
end

for i=1:N
    pivot = a[i,i]
    if abs(pivot) < ε
        println( "ピボットが許容誤差以下" )
        exit()
    end

    for j=1:2*N
        a[i,j] /= pivot
    end
    for k=1:N
        δ = a[k,i]
        for j=1:2N
            if k != i
                a[k, j] -= δ * a[i,j]
            end
        end
    end
end

for y=1:N
    for x=N+1:2N
        @printf( "%7.3f ", a[y,x] )
    end
    println()
end
