# 時間分割法による高速DFT

using Printf

const L = 3     # 最大サンプル数

r = zeros(1024)
i = zeros(1024)
wr = zeros(512)
wi = zeros(512)

# ビット逆順配列換え計算
function bit(p)
    # ビット逆順
    for j=0:p-1
        d::Integer = j
        c::Integer = trunc(p / 2.0)
        for k=0:L-1
            global r[j+1] += ( d % 2 ) * c
            d = trunc( d / 2 )
            c = trunc( c / 2 )
        end
    end

    # データ入れ替え
    for j=0:p-1
        global r[j+1] = i[Int(trunc(r[j+1]))+1]
    end

    # 配列i クリア
    for k=0:1023
        global i[k+1] = 0.0
    end
end

# 高速フーリエ変換
function dft(p)
    # 回転因子格納
    for j=0:Int(p/2)
        w = -2.0π / p * j
        global wr[j+1] = cos( w )
        global wi[j+1] = sin( w )
    end

    # 高速フーリエ変換
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

# 複素数のバタフライ演算
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

func_y(x) = 3.0sin(x) + 7.0cos(3.0x)    # 原関数 3sin(x) + 7cos(3x) 定義

p = 2^L

# データを 1/p 倍してサンプリング
for j=0:p-1
    i[j+1] = func_y( (2.0π/p) * j ) / p
end

# 原関数データを表示
println( "No.\tデータ" )
for j=0:p-1
    @printf( "i[%d] = %9.3f\n", j, i[j+1] * p )
end

bit(p)
dft(p)

# dftデータ表示
println( "\n次数\t実数部\t虚数部" )
for j=0:p-1
    @printf( "%4d%9.3f%9.3f\n", j, r[j+1], i[j+1] )
end
