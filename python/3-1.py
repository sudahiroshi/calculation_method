# ラグランジュの補間法

N = 6       # データ数

x = [ 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 ]    # X座標
y = [ 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 ]    # Y座標

# 補間
def lagrange( xx ):
    z = [0] * N
    yy = 0.0

    for k in range(N):
        z[k] = 1.0

        # 係数計算
        for i in range(N):
            # 式(3.14)
            if( i != k ):
                z[k] *= ( xx - x[i] ) / ( x[k] - x[i] )
        
        yy += y[k] * z[k]   # 式(3.13)
    
    return yy

# 補間計算
print( "XX\t\tYY" )                     # 見出し打出し
for xx in range( 0, 50, 2 ):
    yy = lagrange( xx/10.0 )
    print( f"{xx:8.2f}\t{yy:8.2f}")     # 補間結果打出し
