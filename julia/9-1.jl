# 正規乱数検証計算

using Printf

const N = 10000     # 繰り返し回数

# 結果打出し
function print_result( sa, sb, i )
    ave = sa / i
    hh = sb - i * ave^2
    σ = sqrt( hh / i )
    @printf( "%6d %8.4f %8.4f\n", i, ave, σ )
end

# 正規乱数生成
function gauss()
    ss = 0.0
    for i=1:12
        ss += rand()
    end
    return ss - 6.0
end

sa = 0.0
sb = 0.0
println( "回転\t平均値\t標準偏差" )     # 見出し打出し
for i=1:N
    v = gauss()
    global sa += v
    global sb += v^2
    if i%1000 == 0
        print_result( sa, sb, i )
    end
end
