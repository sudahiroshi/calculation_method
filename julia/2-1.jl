using Printf

const N = 3
const ε = 0.001

a = [
    2.0 1.0 3.0 13.0
    1.0 3.0 2.0 13.0
    3.0 2.0 1.0 10.0
]

for i=1:N
    pivot = a[i,i]
    if abs(pivot) < ε
        println( "ピボットが許容誤差以下" )
        exit()
    end

    for j=i:N+1
        a[i,j] /= pivot
    end

    for k=1:N
        if k != i
            δ = a[k,i]
            for j=i:N+1
                a[k,j] -= δ * a[i,j]
            end
        end
    end
end

for l=1:N
    @printf( "X%d = %6.2f\n", l, a[l,N+1] )
end
