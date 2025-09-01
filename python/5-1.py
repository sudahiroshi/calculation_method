# オイラーの前進公式を用いた微分方程式の解法

EPS = 0.00000001        # 許容誤差

# 微分方程式 f(x) = 2x 定義
def func_f( x ):
    return 2.0 * x

# 初期条件
x = 0.0
y = 0.0
h = 0.01
dx = 1.0
xmax = 10.0
ddx = 0.0

print( "X\tY" )     # 見出し打出し
while True:
    if( x >= ddx - EPS ):       # 打出し条件
        ddx += dx
        print( f"{x:7.4f} {y:7.4f}" )   # 解打出し
    
    y += h * func_f( x )        # 関数値増加
    x += h                      # 式(5.4)
    if not( x <= xmax + EPS ):  # 式(5.5)
        break
