# 放物型偏微分方程式

using Printf

const N = 20        # 刻み設定

# 配列宣言
u = ones(N+1)
w = zeros(N+1)
k = 0.001

# 定数計算
h = 1.0 / N
r = k / h^2
s = 1.0 - 2.0r

# 境界条件格納
u[1] = 0.0
u[N+1] = 0.0

# 解打出し
for j=1:200
    if ( j % 10 ) == 0
        @printf( "%5.3f ", j * k )
        for i=0:2:N
            @printf( "%5.3f ", u[i+1] )
        end
        println()
    end

    # 差分計算
    for i=1:N-1
        w[i+1] = r * ( u[i+2] + u[i] ) + s * u[i+1] # 差分近似式(6.9)
    end
    # 境界条件w[1]=w[N+1]=0としているので，
    # 32行目のfor文ではiの値を1〜N-1の範囲で変化させている
    # Juliaでは配列は1からとなるので，それぞれの要素番号に1を加えている

    for i=1:N+1
        u[i] = w[i]     # 計算値置き換え
    end
end

