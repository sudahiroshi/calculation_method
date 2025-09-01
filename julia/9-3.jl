# 窓口平均待ち時間計算

using Printf

const N = 30000     # 来行人数
const M = 5         # 窓口数
const α = 1         # 流れ密度
const μ = 4         # 平均処理時間
const σ = 0.5       # 処理時間のばらつき
const ε = 0.000001  # log 計算時のバイアス

# 正規乱数生成
function gauss()
    δ = 0.0
    for p=1:12
        δ += rand()
    end
    return μ + σ * ( δ - 6.0)
end

# 空き窓口ルーチン
function cll( time, a )
    for j=1:M
        if a[j] < time
            a[j] = 0.0
        end
    end
end

# 待ち解除ルーチン
function tim( ans, time, a, b, k )
    for j=1:k
        mini = findmin(a[1:M])[2]
        if a[mini] < time
            ans += a[mini] - b[1]
            a[mini] += gauss()

            global b = circshift( b, -1 )
            global b[end] = 0.0
            k -= 1
        else
            break
        end
    end
    return ans, k
end

# 窓口選択ルーチン
function sentaku( t, a, b, k )
    for j=1:M
        if a[j] == 0.0
            a[j] = t + gauss()
            return k
        end
    end
    k += 1
    b[k] = t
    return k
end

# 指数乱数生成
function poison()
    τ = -log( rand() + ε ) / α
    return τ
end

k::Integer = 1      # 待ち人数
ans = 0.0
time = 0.0
a = zeros(20)
b = zeros(200)

println( "来行人数    平均待ち時間" )
for i=1:N
    global time += poison()
    global ans, k = tim( ans, time, a, b, k )
    cll( time, a )
    global k = sentaku( time, a, b, k )

    if i % 2000 == 0
        # 解打出し
        @printf( "%6d\t%11.6f\n", i, ans/float(i) )
    end
end
