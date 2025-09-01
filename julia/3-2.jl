# 最小2乗法

using Printf

const N = 6             # データ数
const M = 2             # 回帰曲線の次数
const ε = 0.0001        # 許容誤差

# ガウス-ジョルダン法による連立方程式の計算
function jordan( a )
    for i=1:M+1
        pivot = a[i,i]
        if abs( pivot ) < ε
            println( "ピボットが許容誤差以下" )
            exit()
        end
        for j=i:M+2
            a[i,j] /= pivot
        end

        for k=1:M+1
            if k != i
                δ = a[k,i]
                for j=i:M+2
                    a[k,j] -= δ * a[i,j]
                end
            end
        end
    end
    return
end

a = zeros(M+1, M+2)
x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]    # X座標
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]    # Y座標

# 式(3.23)左辺
for i=0:M, j=0:M, k=1:N
    a[j+1,i+1] += x[k]^(i+j)
end

# 式(3.23)右辺
for j=1:M+1, k=1:N
    a[j,M+2] += y[k] * x[k]^(j-1)
end

jordan( a )

# 係数打出し
for i=1:M+1
    @printf( "A%2d = %7.3f\n", i, a[i,M+2] )
end
