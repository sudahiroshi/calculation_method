# 2分法による方程式の解法

EPS = 0.0001        # 許容誤差

def nibun( a, b ):
    while True:
        c = ( a + b ) / 2.0     # 2分計算
        if( ( func_y(c) * func_y(a) ) < 0 ): b = c  # 式(1.2)
        else: a = c                                 # 式(1.3)
        if not( abs( a - b ) > EPS ): break         # 収束判定式(1.4)の変形
    return c

# 関数 y = x^3 + x - 1
def func_y( x ):
    return pow( x, 3.0 ) + x - 1.0

# 初期値設定
a = 0.0
b = 1.0

print( "x^3 + x -1 = 0 の2分法による数値計算")
print( f"初期値a = {a:6.3f}")
print( f"初期値b = {b:6.3f}")
x = nibun( a, b )
print( f"近似解x = {x:6.3f}")       # 解打出し
