using Printf

const N = 30

func_y( x ) = x^4.0 + 2.0x

y = zeros( N + 1 )
xa = 0.0
xb = 3.0
z = 0.0
h = ( xb - xa ) / N

for i=0:N
    x = xa + h * i
    y[i+1] = func_y(x)
end

for i=2:N
    global z += 2.0y[i]
end
s = ( h / 2.0 ) * ( y[1] + z + y[N+1] )

@printf( "ANS = %8.4f\n", s )
