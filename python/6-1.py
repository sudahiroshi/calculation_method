N = 20

u = [0] * (N+1)
w = [0] * (N+1)
k = 0.001

h = 1.0 / N
r = k / ( h * h )
s = 1.0 - 2.0 * r

for i in range(N):
    u[i] = 1.0
u[0] = 0.0
u[N] = 0.0

for j in range( 1, 201, 1 ):
    if( ( j % 10 ) == 0 ):
        print( f"{j*k:5.3f} ", end="" )
        for i in range( 0, N+1, 2 ):
            print( f"{u[i]:5.3f} ", end="" )
        print()
    
    for i in range( 1, N ):
        w[i] = r * ( u[i+1] + u[i-1] ) + s * u[i]

    for i in range(N+1):
        u[i] = w[i]
