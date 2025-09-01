# 台形公式による積分

using Printf

const N = 30        # 積分刻み数

func_y( x ) = x^4.0 + 2.0x      # 被積分関数 x^4 + 2x 定義

y = zeros( N + 1 )
# 積分範囲
xa = 0.0
xb = 3.0
z = 0.0
h = ( xb - xa ) / N     # 刻み計算

for i=0:N
    x = xa + h * i
    y[i+1] = func_y(x)
end

# 数値積分
for i=2:N
    global z += 2.0y[i]
end
s = ( h / 2.0 ) * ( y[1] + z + y[N+1] )

@printf( "ANS = %8.4f\n", s )   # 解打出し
