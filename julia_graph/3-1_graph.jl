# ラグランジュの補間法

# 環境構築のため，以下2行は1回だけ実行すれば良い
# using Pkg
# Pkg.add("Plots")
using Plots
using Printf

const N = 6         # データ数

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]    # X座標
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]    # Y座標

# 補間
function lagrange( xx )
    z = ones( N )
    yy = 0.0

    for k=1:N
        z[k] = 1.0

        # 係数計算
        for i=1:N
            if i != k
                z[k] *= ( xx - x[i] ) / ( x[k] - x[i] )
            end
        end

        yy += y[k] * z[k]   # 式(3.13)
    end
    return yy
end

# 補間計算
println( "XX\t\tYY" )                       # 見出し打出し
for xx=0.0:0.2:5.0
    yy = lagrange( xx )
    @printf( " %8.2f\t%8.2f\n", xx, yy )    # 補間結果打出し
end

xx = range( 0.0, 5.0, length=100 )
graph = plot( xx, lagrange.(xx) )
graph = plot!( x, y, seriestype=:scatter )
plot( graph ) |> display
readline()
