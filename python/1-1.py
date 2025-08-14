EPS = 0.0001

def nibun( a, b ):
    while True:
        c = ( a + b ) / 2.0
        if( ( func_y(c) * func_y(a) ) < 0 ): b = c
        else: a = c
        if not( abs( a - b ) > EPS ): break
    return c

def func_y( x ):
    return pow( x, 3.0 ) + x - 1.0

a = 0.0
b = 1.0

print( "x^3 + x -1 = 0 の2分法による数値計算")
print( f"初期値a = {a:6.3f}")
print( f"初期値b = {b:6.3f}")
x = nibun( a, b )
print( f"近似解x = {x:6.3f}")
