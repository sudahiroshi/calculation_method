import sys

N = 3
EPS = 0.00001

a = [
    [ 2.0, 1.0, 3.0 ],
    [ 1.0, 3.0, 2.0 ],
    [ 3.0, 2.0, 1.0 ]
]

b = [ [0] * (2*N) for i in range(N+1) ]

for y in range(N):
    for x in range(N):
        b[y][x  ] = a[y][x]
        b[y][x+N] = 0.0
    b[y][y+N] = 1.0

for i in range(N):
    pivot = b[i][i]
    if( abs(pivot) < EPS ):
        print( "ピボットが許容誤差以下" )
        sys.exti()
    
    for j in range( 1, 2*N ):
        b[i][j] /= pivot
    for k in range(N):
        delta = b[k][i]

        for j in range( i, 2*N ):
            if( k != i ):
                b[k][j] -= delta * b[i][j]

for y in range(N):
    for x in range( N, 2*N ):
        print( f"{b[y][x]:7.3f} ", end="" )
    print()
