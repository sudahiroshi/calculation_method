# 逆行列の計算

using Printf

const N = 3         # 次数設定
const ε = 0.0001    # 許容誤差

# 配列宣言
# 配列aの左半分：係数行列，右半分：単位行列
a = hcat([
    2.0 1.0 3.0
    1.0 3.0 2.0
    3.0 2.0 1.0
], ( zeros(N,2N) |> one ) )

# 掃き出し計算部
for i=1:N
    pivot = a[i,i]
    if abs(pivot) < ε       # エラー打出し
        println( "ピボットが許容誤差以下" )
        exit()
    end

    for j=1:2*N
        a[i,j] /= pivot
    end
    for k=1:N
        δ = a[k,i]
        # 配列aをすべて掃き出す操作
        for j=1:2N
            if k != i
                a[k, j] -= δ * a[i,j]
            end
        end
    end
end

# 解打出し部，配列aの右半分が解答
for y=1:N
    for x=N+1:2N
        @printf( "%7.3f ", a[y,x] )
    end
    println()
end
