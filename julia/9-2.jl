using Printf

const N = 10000
const DIM = 5
m = zeros(DIM)

println( " 回数\t円面積\t球体積\t4次元\t5次元")
for n=1:N
    x = rand(5)
    r = zeros(5)
    rr = 0.0
    for j=1:DIM
        rr += ( x[j] - 0.5 )^2
        r[j] = rr
    end
    for j=2:DIM
        if r[j] < 0.25
            m[j] += 1
        end
    end
    if ( n % 1000 ) == 0
        @printf( "%6d", n )
        for j=2:DIM
            @printf( "%9.4f", m[j]/n )
        end
        println()
    end
    # @printf( "%6d", n )
    # for j=1:DIM
    #     @printf( "%9.4f", float(r[j]) )
    #     @printf( "%9.4f", float(m[j])/float(n) )
    # end
    # println()
end

