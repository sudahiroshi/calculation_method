# DFTの計算

# 環境構築のため，以下2行は1回だけ実行すれば良い
# using Pkg
# Pkg.add("Plots")
using Plots
using Printf

const P = 10        # サンプル数
freq = []
amp = []
real_value = []
imag_value = []

func_y( x ) = 3.0 * sin(3x) + 7.0 * cos( 3.0x )  # 現関数 3sin(x) + 7cos(3x) 定義

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
    push!( freq, n )
    push!( amp, abs(a) )
    push!( real_value, real(a) )
    push!( imag_value, imag(a) )
    @printf( "%4d %9.3f %9.3f %9.3f\n", n, real(a), imag(a), abs(a) )
end

x = range(0,2π,length=P)
f2 = func_y.(x)
println(f2)
graph1 = plot( x, f2, seriestype=:scatter, label="sampling", xticks=(0:P) )
x=range(0,2π,length=200)
graph1 = plot!( x, func_y.(x), label="theory", xgrid=true )

graph2 = plot( freq, real_value, seriestype=:bar, label="Real", xticks=0:9 )
graph2 = plot!( freq, imag_value, seriestype=:bar, label="Imag", xticks=0:9 )
plot( graph1, graph2, layout=(2,1) ) |> display
readline()