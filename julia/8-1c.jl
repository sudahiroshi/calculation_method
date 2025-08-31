# DFTの計算

using Printf

const P = 10        # サンプル数

func_y( x ) = 3.0 * sin(x) + 7.0 * cos( 3.0x )  # 現関数 3sin(x) + 7cos(3x) 定義

# データサンプリング
f = [ func_y( 2.0π / P * m) / P for m=0:P-1]

# DFT係数計算
println( "次数\t実数部\t 虚数部\t   絶対値" )   # 見出し打出し
for n=0:P-1
    a = 0.0 + 0.0im
    for m=0:P-1
        x = 2.0π / P * m * n
        a += complex( f[m+1] * cos( -x ),  f[m+1] * sin( -x ) )
    end
    a /= P
    @printf( "%4d %9.3f %9.3f %9.3f\n", n, real(a), imag(a), abs(a) )
end