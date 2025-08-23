using Printf

const N = 20

u = ones(N+1)
w = zeros(N+1)
k = 0.001

h = 1.0 / N
r = k / h^2
s = 1.0 - 2.0r

u[1] = 0.0
u[N+1] = 0.0

for j=1:200
    if ( j % 10 ) == 0
        @printf( "%5.3f ", j * k )
        for i=0:2:N
            @printf( "%5.3f ", u[i+1] )
        end
        println()
    end

    for i=1:N-1
        w[i+1] = r * ( u[i+2] + u[i] ) + s * u[i+1]
    end

    for i=1:N+1
        u[i] = w[i]
    end
end

