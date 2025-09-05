# ニュートン法による方程式の解法

# 環境構築のため，以下2行は1回だけ実行すれば良い
# using Pkg
# Pkg.add("Plots")
using Plots
using Printf

const ε = 0.0001    # 許容誤差
ans_x = []
ans_y = []

func_y( x ) = x^3.0 + x - 1.0   # 関数 y = x^3 + x - 1
func_z( x ) = 3.0x^2.0 + 1.0    # 導関数 z = 3x^2 + 1

# 初期値設定
a = 1.0
b = 0
push!( ans_x, a )

while true
    global b = a - func_y(a) / func_z(a)    # 式(1.9)
    push!( ans_x, b )
    if abs( a- b ) < ε                      # 収束判定
        break
    else
        global a = b
    end
end
@printf( "近似解x = %6.3f\n", b )

x = range( 0, 2, length=200 )
graph = plot( x, func_y.(x) )
graph = plot!( ans_x, func_y.(ans_x), seriestype=:scatter )
plot( graph ) |> display
readline()