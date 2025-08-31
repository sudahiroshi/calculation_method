# ニュートン法による方程式の解法

EPS = 0.0001        # 許容誤差

# 関数 y = x^3 + x - 1
def func_y( x ):
    return pow( x, 3.0 ) + x - 1.0

# 導関数 z = 3x^2 + 1
def func_z( x ):
    return 3.0 * pow( x, 2.0 ) + 1.0

# 初期値設定
a = 1.0

while True:
    b = a - func_y(a) / func_z(a)       # 式(1.9)
    if( abs( a -b ) < EPS ): break      # 収束判定
    else: a = b

# 解打出し
print( f"近似解x = {a:6.3f}")
