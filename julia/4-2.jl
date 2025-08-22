using Printf

const N = 30

function func_y( x )
    return x^4.0 + 2.0x
end

y = zeros( N+1 )
xa = 0.0
xb = 3.0
z1 = 0.0
z2 = 0.0
h = ( xb -xa ) / N

for i=0:N
    x = xa + h * i
    y[i+1] = func_y( x )
end

for i=1:2:N-1
    global z1 += 4.0 * y[i+1]
end
for i=2:2:N-2
    global z2 += 2.0 * y[i+1]
end
s = ( h / 3.0 ) * ( y[1] + z1 + z2 + y[N+1] )

@printf( "ANS = %8.4f\n", s )
