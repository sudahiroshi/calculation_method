# ラグランジュの補間法

N = 6

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]

def lagrange( xx ):
    z = [0] * N
    yy = 0.0

    for k in range(N):
        z[k] = 1.0

        for i in range(N):

            if( i != k ):
                z[k] *= ( xx - x[i] ) / ( x[k] - x[i] )
        
        yy += y[k] * z[k]
    
    return yy

print( "XX\t\tYY" )
for xx in range( 0, 50, 2 ):
    yy = lagrange( xx/10.0 )
    print( f"{xx:8.2f}\t{yy:8.2f}")
