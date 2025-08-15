N = 20

u = [0] * (N+1)
v = [0] * (N+1)
w = [0] * (N+1)
k = 0.01

h = 1.0 / N
r = k / h
q = r * r
s = 2.0 * ( 1.0 - q )

for i in range( int(N / 2) ):
    u[i] = i / N
for i in range( int(N/2), N+1 ):
    u[i] = 1.0 - i / N
for i in range(N+1):
    v[i] = u[i]
for i in range(N+1):
    w[i] = 0.0

for j in range(200+1):
    if( ( j % 10 ) == 0 ):
        print( f"{j*k:5.3f} ", end="" )
        for i in range( 0, N+1, 2 ):
            print( f"{u[i]:6.2f}", end="" )
        print()
    
    for i in range( 1, N ):
        w[i] = q * ( u[ i + 1 ] + u[ i - 1 ] ) + s * u[i] - v[i]
    for i in range( N+1 ):
        v[i] = u[i]
        u[i] = w[i]
