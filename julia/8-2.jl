using Printf

const L = 3
r = zeros(1024)
i = zeros(1024)
wr = zeros(512)
wi = zeros(512)


function bit(p)
    for j=0:p-1
        d::Integer = j
        c::Integer = trunc(p / 2.0)
        for k=0:L-1
            global r[j+1] += ( d % 2 ) * c
            d = trunc( d / 2 )
            c = trunc( c / 2 )
        end
    end
    for j=0:p-1
        global r[j+1] = i[Int(trunc(r[j+1]))+1]
    end

    for k=0:1023
        global i[k+1] = 0.0
    end
end

function dft(p)
    for j=0:Int(p/2)
        w = -2.0π / p * j
        global wr[j+1] = cos( w )
        global wi[j+1] = sin( w )
    end

    for j=0:L-1
        t = 2^j
        q = 2^(L - 1.0 - j)
        for k=0:q-1, h=0:t-1
            a = Int( k * 2.0 * t + h )
            b = Int( a + t )
            bat( h, q, a, b )
        end
    end
end

function bat( h, q, a, b )
    w = Int( h * q )
    ra = r[a+1] + r[b+1] * wr[w+1] - i[b+1] * wi[w+1]
    ia = i[a+1] + r[b+1] * wi[w+1] + i[b+1] * wr[w+1]
    rb = r[a+1] - r[b+1] * wr[w+1] + i[b+1] * wi[w+1]
    ib = i[a+1] - r[b+1] * wi[w+1] - i[b+1] * wr[w+1]
    global r[a+1] = ra
    global i[a+1] = ia
    global r[b+1] = rb
    global i[b+1] = ib
end

func_y(x) = 3.0sin(x) + 7.0cos(3.0x)

p = 2^L

for j=0:p-1
    i[j+1] = func_y( (2.0π/p) * j ) / p
end

println( "No.\tデータ" )
for j=0:p-1
    @printf( "i[%d] = %9.3f\n", j, i[j+1] * p )
end

bit(p)
dft(p)

println( "\n次数\t実数部\t虚数部" )
for j=0:p-1
    @printf( "%4d%9.3f%9.3f\n", j, r[j+1], i[j+1] )
end
