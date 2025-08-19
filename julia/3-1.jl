using Printf

const N = 6

function lagrange( xx )
    z = ones( N )
    yy = 0.0

    for k=1:N
        z[k] = 1.0

        for i=1:N
            if i != k
                z[k] *= ( xx - x[i] ) / ( x[k] - x[i] )
            end
        end

        yy += y[k] * z[k]
    end
    return yy
end

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]

println( "XX\t\tYY" )
for xx=0.0:0.2:5.0
    yy = lagrange( xx )
    @printf( " %8.2f\t%8.2f\n", xx, yy )
end
