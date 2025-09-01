# 台形公式による積分

N = 30              # 積分刻み数

# 被積分関数 x^4 + 2x 定義
def func_y( x ):
    return pow( x, 4.0 ) + 2.0 * x

y = [0] * (N+1)
# 積分範囲
xa = 0.0
xb = 3.0
z = 0.0
h = ( xb - xa ) / N     # 刻み計算

for i in range(N+1):
    x = xa + h * i
    y[i] = func_y( x )

# 数値積分
for i in range(N):
    z += 2.0 * y[i]
    s = ( h / 2.0 ) * ( y[0] + z + y[N] )

print( f"ANS = {s:8.4f}" )  # 解打出し
