# オイラーの前進公式を用いた微分方程式の解法

using Printf

const ε = 0.00000001        # 許容誤差

func_f(x) = 2.0x        # 微分方程式 f(x) = 2x 定義

# 初期条件
x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

println( "X\tY" )       # 見出し打出し
while true
    if( x >= ddx - ε )      # 打出し条件
        global ddx += dx
        @printf( "%7.4f %7.4f\n", x, y )    # 解打出し
    end

    global y += h * func_f( x )     # 関数値増加
    global x += h                   # 式(5.4)
    if !( x <= xmax + ε )           # 式(5.5)
        break
    end
end
