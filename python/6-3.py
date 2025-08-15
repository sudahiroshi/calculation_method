u = [ [0] * 11 for i in range(11) ]
w = [ [0] * 11 for i in range(11) ]
dd = 0.0
nh = 10

for i in range(nh):
    u[i][nh] = 1.0

while True:
    dd = 0.0
    for i in range( 1, nh ):
        for j in range( 1, nh ):
            u1 = u[i+1][j  ] + u[i-1][j  ]
            u2 = u[i  ][j+1] + u[i  ][j-1]
            u[i][j] = ( u1 + u2 ) / 4.0
            dd += abs( w[i][j] - u[i][j] )
            w[i][j] = u[i][j]
    if not( dd > 0.001 ):
        break

for i in range( nh+1 ):
    for j in range( nh+1 ):
        print( f"{u[i][j]:6.3f}", end="" )
    print()
