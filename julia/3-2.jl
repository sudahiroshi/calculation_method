using Printf

const N = 6
const M = 2
const ε = 0.0001

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
x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]

for i=0:M, j=0:M, k=1:N
    a[j+1,i+1] += x[k]^(i+j)
end
print(a)
for j=1:M+1, k=1:N
    a[j,M+2] += y[k] * x[k]^(j-1)
end

jordan( a )

for i=1:M+1
    @printf( "A%2d = %7.3f\n", i, a[i,M+2] )
end




