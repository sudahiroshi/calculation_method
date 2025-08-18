import math
import random

N = 30000
M = 5
ALF = 1
DEL = 4
SIG = 0.5
EPS = 0.000001

def gauss():
    delta = 0.0

    for p in range(12):
        delta += random.random()
    return( DEL + SIG * ( delta - 6.0 ) )

def cll( time, a ):
    for j in range(M):
        if( a[j] < time ):
            a[j] = 0.0
            return

def minimum( a ):
    mini = min( a[0:M] )
    return a.index( mini )


def tim( ans, time, a, b, k ):
    l = 0
    while( k != 0 ):
        mini = minimum(a)
        if( a[mini] >= time ):
            break
        
        ans += a[mini] - b[0]
        a[mini] += gauss()
        k -= 1
        for l in range(k):
            b[l] = b[l+1]
        b[l+1] = 0.0
    return ans, k

def sentaku( t, a, b, k ):
    for j in range(M):
        if( a[j] == 0.0 ):
            a[j] = t + gauss()
            return k

    b[k] = t
    k += 1
    return k

def poison():
    tau = -math.log( random.random() + EPS ) / ALF
    return tau

k = 0
ans = 0.0
time = 0.0
a = [0] * 20
b = [0] * 200

print( "来行人数    平均待ち時間" )
for i in range( 1, N+1 ):
    time += poison()
    ans, k = tim( ans, time, a, b, k )
    cll( time, a )
    k = sentaku( time, a, b, k )

    if( i % 2000 == 0 ):
        print( f"{i:6d}\t{ans/i:11.6f}" )
