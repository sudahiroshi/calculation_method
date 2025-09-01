# ベアストウ法

import math
import sys

EPS = 0.0001        # 許容誤差

# 2次式の積に変換する
def bairstow( a, n ):
    b = [0] * (n+1)
    c = [0] * (n+1)
    p = 1.0         # 2次因数初期値
    q = 1.0         # 2次因数初期値

    while True:
        b[0] = a[0]
        b[1] = a[1] - p * b[0]

        # 商の係数行列
        for k in range(2, n+1, 1):
            b[k] = a[k] - p * b[k-1] - q * b[k-2]

        c[0] = b[0]
        c[1] = b[1] - p * c[0]
        for k in range(2, n+1, 1):
            c[k] = b[k] - p * c[k-1] - q * c[k-2]
        e = c[n-2] * c[n-2] - c[n-3] * ( c[n-1] - b[n-1] )
                                    # 式(1.31)
        dp = ( b[n-1] * c[n-2] - b[n  ] * c[n-3] ) / e;
                                    # 式(1.29)
        dq = ( b[n  ] * c[n-2] - b[n-1] * ( c[n-1] - b[n-1] ) ) / e;
                                    # 式(1.30)
                                    # 収束係数
        p += dp
        q += dq
        # 余剰ゼロ判定式(1.28)
        if not( (abs(dp) > EPS) or (abs(dq)>EPS) ): break

    for i in range(n-1):
        a[i] = b[i]
    
    return p, q

# 2次式の球根
def root( p, q ):
    d = p * p - 4.0 * q     # 判別式
    if( d<=0 ):             # 実根の計算
        f = math.sqrt(-d)
        r1 = -p / 2.0
        r2 = -p / 2.0
        i1 =  f / 2.0
        i2 = -f / 2.0
    else:                   # 虚根の計算
        f = math.sqrt( d )
        r1 = ( -p + f ) / 2.0
        r2 = ( -p - f ) / 2.0
        i1 = 0.0
        i2 = 0.0
    # 打出し
    print( f"{r1:8.5f}\t{i1:8.5f}\n{r2:8.5f}\t{i2:8.5f}")

n = 4                       # 式次数宣言
a = [ 1, -2, 2, -50, 62 ]   # 係数

# メインルーチン
print( "実数部\t\t虚数部")  # 見出し打出し
while True:
    if( n==1 ):     # 1次式求根，打出し
        print( f"{-a[1]/a[0]:8.5f}\t\t{0.0:8.5f}" )
        sys.exit()
    if( n==2 ):     # 2次式求根
        root( a[1], a[2] )
        sys.exit()
    if( n==0 ):
        sys.exit()
    
    # 2次因数分解
    p, q = bairstow( a, n )
    root( p, q )
    n-=2

 