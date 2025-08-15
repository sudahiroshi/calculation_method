import math

EPS = 0.00000001

def func_f( x, y, z ):
    return z

def func_g( x, y, z ):
    return 3.0 * z - 2.0 * y

x = 0.0
y = 3.0
z = 4.0
h = 0.005
dx = 0.2
xmax = 2.0
ddx = 0.0

print( f"{'X':>5s} {'Y':>10s} {'RY':>10s} {'Z':>10s} {'RZ':>10s}" )

while True:
    if( x >= ddx - EPS ):
        ddx += dx
        ry = 2.0 * math.exp( x ) + math.exp( 2.0 * x )
        rz = 2.0 * math.exp( x ) + 2.0 * math.exp( 2.0 * x )
        print( f"{x:10.4f} {y:10.4f} {ry:10.4f} {z:10.4f} {rz:10.4f}" )
    
    b1 = func_f( x, y, z )
    c1 = func_g( x, y, z )
    b2 = func_f( x + h / 2.0, y + h * b1 / 2.0, z + h * c1 / 2.0 )
    c2 = func_g( x + h / 2.0, y + h * b1 / 2.0, z + h * c1 / 2.0 )
    b3 = func_f( x + h / 2.0, y + h * b2 / 2.0, z + h * c2 / 2.0 )
    c3 = func_g( x + h / 2.0, y + h * b2 / 2.0, z + h * c2 / 2.0 )
    b4 = func_f( x + h      , y + h * b3      , z + h * c3       )
    c4 = func_g( x + h      , y + h * b3      , z + h * c3       )

    y += ( h / 6.0 ) * ( b1 + 2.0 * b2 + 2.0 * b3 + b4 )
    z += ( h / 6.0 ) * ( c1 + 2.0 * c2 + 2.0 * c3 + c4 )
    x += h
    if not( x <= xmax + EPS ):
        break
