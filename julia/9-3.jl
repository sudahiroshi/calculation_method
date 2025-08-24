using Printf

const N = 30000
const M = 5
const α = 1
const μ = 4
const σ = 0.5
const ε = 0.000001

function gauss()
    δ = 0.0
    for p=1:12
        δ += rand()
    end
    return μ + σ * ( δ - 6.0)
end

function cll( time, a )
    for j=1:M
        if a[j] < time
            a[j] = 0.0
        end
    end
end

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

function poison()
    τ = -log( rand() + ε ) / α
    return τ
end

k::Integer = 1
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
        @printf( "%6d\t%11.6f\n", i, ans/float(i) )
    end
end
