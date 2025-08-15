import sys

N = 3
EPS = 0.001

a = [
    [ 2, 1, 3, 13 ],
    [ 1, 3, 2, 13 ],
    [ 3, 2, 1, 10 ]
]

for i in range(N):
    pivot = a[i][i]
    if( abs( pivot ) < EPS ):
        print( "ピボットが許容誤差以下" )
        sys.exit()
    for j in range(i,N+1,1):
        a[i][j] /= pivot
    
    for k in range(N):
        if( k != i ):
            delta = a[k][i]
            for j in range(i,N+1,1):
                a[k][j] -= delta * a[i][j]

for l in range(N):
    print( f"X{l} = {a[l][N]:6.2f}" )