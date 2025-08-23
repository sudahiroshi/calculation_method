using Printf

const N = 20

u = zeros(N+1)
v = zeros(N+1)
w = zeros(N+1)
k = 0.01

h = 1.0 / N
r = k / h
q = r^2
s = 2.0 * ( 1.0 - q )

for i=0:Int64(N/2)
    u[i+1] = float(i) / float(N)
end
for i=Int64(N/2):N
    u[i+1] = 1.0 - float(i) / float(N)
end
for i=0:N
    v[i+1] = u[i+1]
end

for j=0:200
    if ( j % 10 ) == 0
        @printf( "%5.3f ", j * k )
        for i=0:2:N
            @printf( "%6.2f", u[i+1] )
        end
        println()
    end

    for i=1:N-1
        w[i+1] = q * ( u[i+2] + u[i] ) + s * u[i+1] - v[i+1]
    end
    for i=0:N
        v[i+1] = u[i+1]
        u[i+1] = w[i+1]
    end
end