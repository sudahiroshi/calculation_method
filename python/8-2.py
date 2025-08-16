import math

L = 3

r = [0] * 1024
i = [0] * 1024
wr = [0] * 512
wi = [0] * 512

def bit( p ):
    for j in range(p):
        d = j
        c = p / 2
        for k in range(L):
            r[j] += ( d % 2 ) * c
            d = int( d / 2 )
            c = int( c / 2 )

    for j in range(p):
        r[j] = i[ int(r[j]) ]
    
    for k in range(1024):
        i[k] = 0.0
    
def dft( p ):
    for j in range( int(p/2) ):
        w = -2.0 * math.pi / p * j
        wr[j] = math.cos( w )
        wi[j] = math.sin( w )
    
    for j in range(L):
        t = pow( 2.0, j )
        q = pow( 2.0, L - 1.0 - j )
        for k in range(int(q)):
            for h in range(int(t)):
                a = int( k * 2.0 * t + h )
                b = int( a + t )
                bat( h, q, a, b )

def bat( h, q, a, b ):
    w = int( h * q )
    ra = r[a] + r[b] * wr[w] - i[b] * wi[w]
    ia = i[a] + r[b] * wi[w] + i[b] * wr[w]
    rb = r[a] - r[b] * wr[w] + i[b] * wi[w]
    ib = i[a] - r[b] * wi[w] - i[b] * wr[w]
    r[a] = ra
    i[a] = ia
    r[b] = rb
    i[b] = ib

def func_y( x ):
    return 3.0 * math.sin( x ) + 7.0 * math.cos( 3.0 * x )

p = int( pow( 2.0, L ) )

for j in range(p):
    i[j] = func_y( ( 2.0 * math.pi / p ) * j ) / p

print( "No.\tデータ" )
for j in range(p):
    print( f"i[{j}] = {i[j] * p:9.3f}")

bit(p)
dft(p)

print( "\n次数\t実数部\t虚数部" )
for j in range(p):
    print( f"{j:4d}{r[j]:9.3f}{i[j]:9.3f}" )

