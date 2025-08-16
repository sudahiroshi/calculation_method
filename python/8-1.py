import math
P = 10

def func_y( x ):
    return 3.0 * math.sin( x ) + 7.0 * math.cos( 3.0 * x )

f = [0] * P

for m in range(P):
    f[m] = func_y( 2.0 * math.pi / P * m )

print( "次数\t実数部\t 虚数部\t  絶対値" )
for n in range(P):
    ar = 0.0
    ai = 0.0
    for m in range(P):
        x = 2.0 * math.pi / P * m * n
        ar += f[m] * math.cos( -x )
        ai += f[m] * math.sin( -x )
    ar /= P
    ai /= P
    x = math.sqrt( ar * ar + ai * ai )
    print( f"{n:4d} {ar:9.3f} {ai:9.3f} {x:9.3f}" )
