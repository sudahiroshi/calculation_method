using Printf

const N = 3
const ε = 0.0001
const MAX_LOOP = 30

a = [
    5.0 1.0 1.0 10.0
    1.0 4.0 1.0 12.0
    2.0 1.0 3.0 13.0
]

x = ones(N+1)
y = zeros(N+1)

for k=0:MAX_LOOP
    q = 0.0
    for i=1:N
        s=0.0
        for j=1:N
            if i != j
                s += a[i,j] * x[j]
            end
        end
        y[i] = ( a[i,N+1] - s ) / a[i,i]
        q += abs( x[i] - y[i] )
        x[i] = y[i]
    end
    if q < ε
        for i=1:N
            @printf( "x%d = %9.6f\n", i, x[i] )
        end
        exit()
    end
end
println( "収束せず" )
