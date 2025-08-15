# 最小2乗法

import sys

N = 6
M = 2
EPS = 0.0001

a = [ [0]*(M+2) for i in range(M+1) ]

def jordan():
    for i in range(M+1):
        pivot = a[i][i]
        if( abs(pivot) < EPS ):
            print("ピボットが許容誤差以下")
            return 1
        for j in range( i, M+2 ):
            a[i][j] /= pivot

        for k in range(M+1):
            if( k!=i ):
                delta = a[k][i]
                for j in range(i,M+2):
                    a[k][j] -= delta * a[i][j]
    return 0

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]

for i in range(M+1):
    for j in range(M+2):
        a[i][j] = 0.0

for i in range(M+1):
    for j in range(M+1):
        for k in range(N):
            a[j][i] = a[j][i] + pow( x[k], i+j )

for j in range(M+1):
    for k in range(N):
        a[j][M+1] += y[k] * pow( x[k], j )

if( jordan() == 1 ):
    sys.exit()

for i in range(M+1):
    print( f"A{i:2d} = {a[i][M+1]:7.3f}" )
