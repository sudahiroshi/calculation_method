import random

N = 10000
DIM = 5

x = [0] * DIM
r = [0] * DIM
m = [0] * DIM

print( " 回数円面積球体積4次元5次元" )
for n in range( 1, N+1 ):
    for j in range( DIM ):
        x[j] = random.random()
        r[j] = 0.0
    rr = 0.0
    for j in range(DIM):
        rr += ( x[j] - 0.5 ) * ( x[j] - 0.5 )
        r[j] = rr
    for j in range(DIM):
        if( r[j] <= 0.25 ):
            m[j] += 1
    if( ( n % 1000 ) == 0 ):
        print( f"{n:6d}", end="" )
        for j in range( 1, DIM ):
            print( f"{float(m[j])/float(n):9.4f}", end="" )
        print()
