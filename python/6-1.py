# 放物型偏微分方程式

N = 20          # 刻み設定

# 配列宣言
u = [1.0] * (N+1)
w = [0.0] * (N+1)
k = 0.001

# 定数計算
h = 1.0 / N
r = k / ( h * h )
s = 1.0 - 2.0 * r

# 境界条件格納
u[0] = 0.0
u[N] = 0.0

# 解打出し
for j in range( 1, 201, 1 ):
    if( ( j % 10 ) == 0 ):
        print( f"{j*k:5.3f} ", end="" )
        for i in range( 0, N+1, 2 ):
            print( f"{u[i]:5.3f} ", end="" )
        print()
    
    # 差分計算
    for i in range( 1, N ):
        w[i] = r * ( u[i+1] + u[i-1] ) + s * u[i]   # 差分近似式(6.9)
    # 境界条件w[0]=w[N]=0は普遍としているので，
    # 30行目のfor文ではiの値を1〜N-1の範囲で変化させている

    for i in range(N+1):
        u[i] = w[i]     # 計算値置き換え
