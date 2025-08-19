import math

N = 3
EPS = 0.0001

a = [
    [  5.0000, -1.4142,  0.0000 ],
    [ -1.4142,  1.5000, -0.4082 ],
    [  0.0000, -0.4082,  0.3333 ]
]
u = [ [0] * N for i in range(N) ]

for i in range(N):
    u[i][i] = 1.0

while True:
    max = 0.0
    for i in range(N-1):
        for j in range(i+1, N ):
            if( abs( a[i][j] ) > max ):
                p = i
                q = j
                max = abs( a[i][j] )
    
    if( max < EPS ):
        break
    
    wa = a[p][p]
    wb = a[p][q]
    wc = a[q][q]
    alpha = -wb
    beta = 0.5 * ( wa - wc )
    gamma = abs( beta ) / math.sqrt( alpha * alpha + beta * beta )
    s = math.sqrt( 0.5 * ( 1.0 - gamma ) )
    if( alpha * beta < 0 ):
        s = -s
    c = math.sqrt( 1.0 - s * s )

    for j in range(N):
        w = a[p][j] * c - a[q][j] * s
        a[q][j] = a[p][j] * s + a[q][j] * c
        a[p][j] = w

    for j in range(N):
        a[j][p] = a[p][j]
        a[j][q] = a[q][j]

    w = 2.0 * wb * s * c
    a[p][p] = wa * c * c + wc * s * s - w
    a[q][q] = wa * s * s + wc * c * c + w
    a[p][q] = 0
    a[q][p] = 0

    for i in range(N):
        w = u[i][p] * c - u[i][q] * s
        u[i][q] = u[i][p] * s + u[i][q] * c
        u[i][p] = w

print( "固有値" )
for i in range(N):
    print( f"{a[i][i]:7.4f} ", end="" )
print()
print()
print( "固有ベクトル" )
for i in range(N):
    for j in range(N):
        print( f"{u[i][j]:7.4f} ", end="" )
    print()
