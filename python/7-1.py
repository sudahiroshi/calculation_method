# 逆行列の計算

import sys

N = 3           # 次数設定
EPS = 0.00001   # 許容誤差

# 配列宣言
# 係数行列
a = [
    [ 2.0, 1.0, 3.0 ],
    [ 1.0, 3.0, 2.0 ],
    [ 3.0, 2.0, 1.0 ]
]

b = [ [0] * (2*N) for i in range(N+1) ]

# 配列bの左半分：係数行列，右半分：単位行列
for y in range(N):
    for x in range(N):
        b[y][x  ] = a[y][x]
        b[y][x+N] = 0.0
    b[y][y+N] = 1.0

# 掃き出し計算部
for i in range(N):
    pivot = b[i][i]
    if( abs(pivot) < EPS ):     # エラー打出し
        print( "ピボットが許容誤差以下" )
        sys.exti()
    
    for j in range( 1, 2*N ):
        b[i][j] /= pivot
    for k in range(N):
        delta = b[k][i]
        # 配列bをすべて掃き出す操作
        for j in range( i, 2*N ):
            if( k != i ):
                b[k][j] -= delta * b[i][j]

# 解打出し部，配列bの右半分が解答
for y in range(N):
    for x in range( N, 2*N ):
        print( f"{b[y][x]:7.3f} ", end="" )
    print()
