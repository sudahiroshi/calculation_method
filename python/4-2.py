N = 30

def func_y( x ):
    return pow( x, 4.0 ) + 2.0 * x

y = [0] * (N+1)
xa = 0.0
xb = 3.0
z1 = 0.0
z2 = 0.0

h = ( xb - xa ) / N

for i in range(N+1):
    x = xa + h * i
    y[i] = func_y( x )

for i in range( 1, N, 2 ):
    z1 += 4.0 * y[i]
for i in range( 2, N-1, 2 ):
    z2 += 2.0 * y[i]
s = ( h / 3.0 ) * ( y[0] + z1 + z2 + y[N] )

print( f"ANS = {s:8.4f}" )
