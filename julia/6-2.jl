# 双曲型偏微分方程式

using Printf

const N = 20        # 刻み設定

# 配列宣言
u = zeros(N+1)
v = zeros(N+1)
w = zeros(N+1)
k = 0.01

# 定数計算
h = 1.0 / N
r = k / h
q = r^2
s = 2.0 * ( 1.0 - q )

# 初期条件，境界条件格納
for i=0:Int64(N/2)
    u[i+1] = float(i) / float(N)
end
for i=Int64(N/2):N
    u[i+1] = 1.0 - float(i) / float(N)
end
for i=0:N
    v[i+1] = u[i+1]
end

for j=0:200
    if ( j % 10 ) == 0
        # 解打出し
        @printf( "%5.3f ", j * k )
        for i=0:2:N
            @printf( "%6.2f", u[i+1] )
        end
        println()
    end

    # 差分計算
    for i=1:N-1
        w[i+1] = q * ( u[i+2] + u[i] ) + s * u[i+1] - v[i+1]    # 差分近似式(6.12)
    end
    for i=0:N
        # 計算値置き換え
        v[i+1] = u[i+1]
        u[i+1] = w[i+1]
    end
end