import math
import random

N = 10000

def print_result( sa, sb, i ):
    ave = sa / i
    hh = sb - i * ave * ave
    sig = math.sqrt( hh/ i )
    print( f"{i:6d} {ave:8.4f} {sig:8.4f}" )

def gauss():
    ss = 0.0

    for i in range(12):
        ss += random.random()
    return ss - 6.0

sa = 0.0
sb = 0.0
print( "回数\t平均値\t標準偏差" )
for i in range( 1, N+1 ):
    v = gauss()
    sa += v
    sb += v * v
    if( ( i % 1000 ) == 0 ):
        print_result( sa, sb, i )
