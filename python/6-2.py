# 双曲型偏微分方程式

N = 20      # 刻み設定

# 配列宣言
u = [0] * (N+1)
v = [0] * (N+1)
w = [0.0] * (N+1)
k = 0.01

# 定数計算
h = 1.0 / N
r = k / h
q = r * r
s = 2.0 * ( 1.0 - q )

# 初期条件，境界条件格納
for i in range( int(N / 2) ):
    u[i] = i / N
for i in range( int(N/2), N+1 ):
    u[i] = 1.0 - i / N
for i in range(N+1):
    v[i] = u[i]

for j in range(200+1):
    if( ( j % 10 ) == 0 ):
        # 解打出し
        print( f"{j*k:5.3f} ", end="" )
        for i in range( 0, N+1, 2 ):
            print( f"{u[i]:6.2f}", end="" )
        print()
    
    # 差分計算
    for i in range( 1, N ):
        w[i] = q * ( u[ i + 1 ] + u[ i - 1 ] ) + s * u[i] - v[i]    # 差分近似式(6.12)
    for i in range( N+1 ):
        # 計算値書き換え
        v[i] = u[i]
        u[i] = w[i]
