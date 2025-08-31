# 2元連立1階微分方程式

using Printf

const ε = 0.00000001        # 許容誤差

func_f( x, y, z ) = z               # 微分方程式 f(x,y,z) = z
func_g( x, y, z ) = 3.0z - 2.0y     # 微分方程式 f(x,y,z) = 3z-2y

# 初期条件
x = 0.0
y = 3.0
z = 4.0
h = 0.005
dx = 0.2
xmax = 2.0
ry = 0.0
rz = 0.0
ddx = 0.0

# 見出し打出し
@printf( "%5s %10s %10s %10s %10s\n", "X", "Y", "RY", "Z", "RZ");

while true
    if x >= ddx - ε
        global ddx += dx
        # 厳密解計算
        global ry = 2.0exp( x ) + exp( 2.0x )
        global rz = 2.0exp( x ) + 2.0exp( 2.0x )
        # 解打出し
        @printf( "%10.4lf %10.4lf %10.4lf %10.4lf %10.4lf\n",
                    x, y, ry, z, rz );
    end

    # 式(5.28)
    b1 = func_f( x, y, z )
    c1 = func_g( x, y, z )
    b2 = func_f( x + h / 2.0, y + h * b1 / 2.0, z + h * c1 / 2.0 )
    c2 = func_g( x + h / 2.0, y + h * b1 / 2.0, z + h * c1 / 2.0 )
    b3 = func_f( x + h / 2.0, y + h * b2 / 2.0, z + h * c2 / 2.0 )
    c3 = func_g( x + h / 2.0, y + h * b2 / 2.0, z + h * c2 / 2.0 )
    b4 = func_f( x + h      , y + h * b3      , z + h * c3       )
    c4 = func_g( x + h      , y + h * b3      , z + h * c3       )

    式(5.27)
    global y += ( h / 6.0 ) * ( b1 + 2.0b2 + 2.0b3 + b4 );
    global z += ( h / 6.0 ) * ( c1 + 2.0c2 + 2.0c3 + c4 );
    global x += h;
    if !( x <= xmax  )
        break
    end
end
