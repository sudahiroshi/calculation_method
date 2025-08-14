EPS = 0.0001

def func_y( x ):
    return pow( x, 3.0 ) + x - 1.0

def func_z( x ):
    return 3.0 * pow( x, 2.0 ) + 1.0

a = 1.0

while True:
    b = a - func_y(a) / func_z(a)
    if( abs( a -b ) < EPS ): break
    else: a = b

print( f"近似解x = {a:6.3f}")
