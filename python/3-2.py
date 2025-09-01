# 最小2乗法

import sys

N = 6           # データ数
M = 2           # 回帰曲線の次数
EPS = 0.0001    # 許容誤差

a = [ [0.0]*(M+2) for i in range(M+1) ]

# ガウス-ジョルダン法による連立方程式の計算
def jordan():
    for i in range(M+1):
        pivot = a[i][i]
        if( abs(pivot) < EPS ):
            print("ピボットが許容誤差以下")
            return 1
        for j in range( i, M+2 ):
            a[i][j] /= pivot

        for k in range(M+1):
            if( k!=i ):
                delta = a[k][i]
                for j in range(i,M+2):
                    a[k][j] -= delta * a[i][j]
    return 0

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]    # X座標
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]    # Y座標

# 式(3.23)左辺
for i in range(M+1):
    for j in range(M+1):
        for k in range(N):
            a[j][i] = a[j][i] + pow( x[k], i+j )

# 式(3.23)右辺
for j in range(M+1):
    for k in range(N):
        a[j][M+1] += y[k] * pow( x[k], j )

if( jordan() == 1 ):
    sys.exit()

# 係数打出し
for i in range(M+1):
    print( f"A{i:2d} = {a[i][M+1]:7.3f}" )
