using Printf

const ε = 0.00000001

func_f( x, y ) = 2.0 * x

x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

println( "X\t Y" )
while true
    if( x >= ddx - ε )
        global ddx += dx
        @printf( "%8.4f %8.4f\n", x, y )
    end

    k1 = func_f( x          , y      )
    k2 = func_f( x + h / 2.0, y + h * k1 / 2.0 )
    k3 = func_f( x + h / 2.0, y + h * k2 / 2.0 )
    k4 = func_f( x + h      , y + h * k3       )

    global y += ( h / 6.0 ) * ( k1 + 2.0 * k2 + 2.0 * k3 + k4 )
    global x += h
    if !(x <= xmax + ε )
        break
    end
end
