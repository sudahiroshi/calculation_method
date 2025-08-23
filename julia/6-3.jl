using Printf

u = zeros(12,12)
w = zeros(12,12)
nh = 10

for i=1:nh-1
    u[i+1, nh+1] = 1.0
end

while true
    dd = 0.0
    for i=1:nh-1, j=1:nh-1
        u1 = u[i+2,j+1] + u[i  , j+1 ]
        u2 = u[i+1,j+2] + u[i+1, j   ]
        u[i+1,j+1] = ( u1 + u2 ) / 4.0
        dd += abs( w[i+1,j+1] - u[i+1,j+1] )
        w[i+1,j+1] = u[i+1,j+1]
    end
    if !(dd > 0.001)
        break
    end
end

for i=0:nh
    for j=0:nh
        @printf( "%6.3f", u[i+1,j+1] )
    end
    println()
end

