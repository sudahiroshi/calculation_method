# ニュートン法による方程式の解法

using Printf

const ε = 0.0001    # 許容誤差

func_y( x ) = x^3.0 + x - 1.0   # 関数 y = x^3 + x - 1
func_z( x ) = 3.0x^2.0 + 1.0    # 導関数 z = 3x^2 + 1

# 初期値設定
a = 1.0
b = 0

while true
    global b = a - func_y(a) / func_z(a)    # 式(1.9)
    if abs( a- b ) < ε                      # 収束判定
        break
    else
        global a = b
    end
end
@printf( "近似解x = %6.3f\n", b )
