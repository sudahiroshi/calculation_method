# 2分法による方程式の解法

using Printf

const ε = 0.0001        # 許容誤差

function nibun( a, b )
    c = 0
    while true
        c = ( a + b ) / 2.0     # 2分計算
        if ( func_y(c) * func_y(a) ) < 0    # 式(1.2)
            b = c
        else
            a = c       # 式(1.3)
        end
        if !( abs( a - b) > ε )     # 収束判定式(1.4)の変形
            break
        end
    end
    return c
end

func_y( x ) = x^3.0 + x - 1.0

# 初期値設定
a = 0.0
b = 1.0

println( "x^3 + x - 1 = 0 の2分法による数値計算\n" )
@printf( "初期値a = %6.3lf\n", a )
@printf( "初期値b = %6.3lf\n", b )
x = nibun( a, b )
@printf( "近似解x = %6.3lf\n", x )      # 解打出し
