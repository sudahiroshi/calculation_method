# 球体の体積計算

using Printf

const N = 10000     # 繰り返し回数
const DIM = 5       # 次元数
m = zeros(DIM)

println( " 回数\t円面積\t球体積\t4次元\t5次元")     # 見出し打出し
for n=1:N
    x = rand(5)
    r = zeros(5)
    rr = 0.0
    for j=1:DIM
        rr += ( x[j] - 0.5 )^2
        r[j] = rr
    end
    for j=2:DIM
        if r[j] < 0.25
            m[j] += 1
        end
    end
    if ( n % 1000 ) == 0
        # 解打出し
        @printf( "%6d", n )
        for j=2:DIM
            @printf( "%9.4f", m[j]/n )
        end
        println()
    end
end

