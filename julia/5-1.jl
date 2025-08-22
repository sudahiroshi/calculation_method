using Printf

const ε = 0.00000001

func_f(x) = 2.0 * x

x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

println( "X\tY" )
while true
    if( x >= ddx - ε )
        global ddx += dx
        @printf( "%7.4f %7.4f\n", x, y )
    end

    global y += h * func_f( x )
    global x += h
    if !( x <= xmax + ε )
        break
    end
end


