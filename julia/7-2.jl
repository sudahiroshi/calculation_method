# ヤコビ法による固有値と固有ベクトル計算

using Printf
using LinearAlgebra

const N = 3         # 次数設定
const ε = 0.0001    # 収束範囲

a = [
     5.0000 -1.4142  0.0000
    -1.4142  1.5000 -0.4082
     0.0000 -0.4082  0.3333
]   # 係数行列
u = Matrix{Float64}( I, N, N )       # 単位行列
p = 0.0
q = 0.0

while true
    # 最大要素の行と列を計算
    max = 0.0
    for i=1:N-1, j=i+1:N
        if abs( a[i,j] ) > max
            global p = i
            global q = j
            max = abs( a[i,j] )
        end
    end

    # 収束したら解打出し
    if max < ε
        break
    end

    # sinθ，cosθ 計算
    wa = a[p,p]
    wb = a[p,q]
    wc = a[q,q]
    α = -wb
    β = 0.5 * ( wa - wc )
    γ = abs( β ) / sqrt( α^2 + β^2 )
    s = sqrt( 0.5 * ( 1.0 - γ ) )
    if α * β < 0
        s = -s
    end
    c = sqrt( 1.0 - s^2 )

    # 直交変換
    for j=1:N
        w = a[p,j] * c - a[q,j] * s
        a[q,j] = a[p,j] * s + a[q,j] * c
        a[p,j] = w
    end

    for j=1:N
        a[j,p] = a[p,j]
        a[j,q] = a[q,j]
    end

    w = 2.0 * wb * s * c
    a[p,p] = wa * c^2 + wc * s^2 - w
    a[q,q] = wa * s^2 + wc * c^2 + w
    a[p,q] = 0.0
    a[q,p] = 0.0

    # 漸化式計算
    for i=1:N
        w = u[i,p] * c - u[i,q] * s
        u[i,q] = u[i,p] * s + u[i,q] * c
        u[i,p] = w
    end
end

println( "固有値" )
for i=1:N
    @printf( "%7.4f ", a[i,i] )
end
println()
println()
println( "固有ベクトル" )
for i=1:N
    for j=1:N
        @printf( "%7.4f ", u[i,j] )
    end
    println()
end
