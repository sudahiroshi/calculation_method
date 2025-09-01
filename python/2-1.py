# ガウス-ジョルダン法

import sys

N = 3               # 次元設定
EPS = 0.001         # 許容誤差

a = [
    [ 2, 1, 3, 13 ],
    [ 1, 3, 2, 13 ],
    [ 3, 2, 1, 10 ]
]                   # 係数データ

# 計算部
for i in range(N):
    pivot = a[i][i]
    if( abs( pivot ) < EPS ):           # 誤差判定
        print( "ピボットが許容誤差以下" )   # エラー打出し
        sys.exit()
    for j in range(i,N+1,1):
        a[i][j] /= pivot
    
    # 吐き出し操作
    for k in range(N):
        if( k != i ):
            delta = a[k][i]
            for j in range(i,N+1,1):
                a[k][j] -= delta * a[i][j]

for l in range(N):
    print( f"X{l} = {a[l][N]:6.2f}" )   # 解打出し