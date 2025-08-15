# ガウスーザイデル法

import sys

N = 3           # 次元設定
EPS = 0.0001    # 許容誤差
MAX_LOOP = 30   # 最大繰り返し数

a = [
    [ 5, 1, 1, 10 ],
    [ 1, 4, 1, 12 ],
    [ 2, 1, 3, 13 ]
]                       # 係数データ

x = [0] * N
y = [0] * N

# 収束計算部
for i in range(N):
    x[i] = 1.0      # 解の初期値

for k in range(MAX_LOOP):
    q = 0.0
    for i in range(N):  # 逐次計算
        s = 0.0
        for j in range(N):
            if( i != j ):
                s += a[i][j] * x[j]
        y[i] = ( a[i][N] - s ) / a[i][i]
        q += abs( x[i] - y[i] )
        x[i] = y[i]             # 誤差集積
    if( q < EPS ):              # 誤差判定
        for i in range(N):
            print( f"x{i} = {x[i]:9.6f}" )
        sys.exit()
print( "収束せず" )


