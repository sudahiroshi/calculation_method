# ルンゲ-クッタの公式を用いた微分方程式の解法

using Printf

const ε = 0.00000001        # 許容誤差

func_f( x, y ) = 2.0x       # 微分方程式 f(x) = 2x 定義

# 初期条件
x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

println( "X\t Y" )      # 見出し打出し
while true
    if( x >= ddx - ε )      # 打出し条件
        global ddx += dx
        @printf( "%8.4f %8.4f\n", x, y )        # 解打出し
    end

    # 式(5.15)
    k1 = func_f( x          , y      )
    k2 = func_f( x + h / 2.0, y + h * k1 / 2.0 )
    k3 = func_f( x + h / 2.0, y + h * k2 / 2.0 )
    k4 = func_f( x + h      , y + h * k3       )

    # 式(5.14)
    global y += ( h / 6.0 ) * ( k1 + 2.0k2 + 2.0k3 + k4 )
    global x += h
    if !(x <= xmax + ε )
        break
    end
end
