EPS = 0.00000001

def func_f( x ):
    return 2.0 * x

x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

print( "X\tY" )
while True:
    if( x >= ddx - EPS ):
        ddx += dx
        print( f"{x:7.4f} {y:7.4f}" )
    
    y += h * func_f( x )
    x += h
    if not( x <= xmax + EPS ):
        break
