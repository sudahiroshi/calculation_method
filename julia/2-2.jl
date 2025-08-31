# ガウス-ザイデル法

using Printf

const N = 3             # 次元設定
const ε = 0.0001        # 許容誤差
const MAX_LOOP = 30     # 最大繰り返し数

a = [
    5.0 1.0 1.0 10.0
    1.0 4.0 1.0 12.0
    2.0 1.0 3.0 13.0
]                       # 係数データ

x = ones(N+1)
y = zeros(N+1)

# 収束計算部
for k=0:MAX_LOOP
    q = 0.0
    for i=1:N
        s=0.0
        for j=1:N       # 逐次計算
            if i != j
                s += a[i,j] * x[j]
            end
        end
        y[i] = ( a[i,N+1] - s ) / a[i,i]
        q += abs( x[i] - y[i] )
        x[i] = y[i]     # 誤差集積
    end
    if q < ε            # 誤差判定
        for i=1:N
            @printf( "x%d = %9.6f\n", i, x[i] ) # 解打出し
        end
        exit()
    end
end
println( "収束せず" )
