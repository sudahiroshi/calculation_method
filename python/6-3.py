# 楕円形偏微分方程式

# 配列宣言
u = [ [0] * 11 for i in range(11) ]
w = [ [0] * 11 for i in range(11) ]
dd = 0.0
nh = 10     # 刻み

# 初期・境界条件
for i in range(nh):
    u[i][nh] = 1.0

# 差分計算（ガウス-ザイデル法）
while True:
    dd = 0.0
    for i in range( 1, nh ):
        for j in range( 1, nh ):
            # 式(6.15)
            u1 = u[i+1][j  ] + u[i-1][j  ]
            u2 = u[i  ][j+1] + u[i  ][j-1]
            u[i][j] = ( u1 + u2 ) / 4.0
            dd += abs( w[i][j] - u[i][j] )
            w[i][j] = u[i][j]
    if not( dd > 0.001 ):
        break

# 解打出し
for i in range( nh+1 ):
    for j in range( nh+1 ):
        print( f"{u[i][j]:6.3f}", end="" )
    print()
