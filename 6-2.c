// 双曲型偏微分方程式

#include    <stdio.h>
#include    <math.h>

#define N   20                      // 刻み設定

int main( int argc, char **argv ) {
    double u[ N+1 ], v[ N+1 ], w[ N+1 ];    // 配列宣言
    double k = .01, h, r, s, q;

    h = 1.0 / (double)N;            // 定数計算
    r = k / h;
    q = r * r;
    s = 2.0 * ( 1.0 - q );

                                    // 初期条件，境界条件格納
    for( int i=0; i<=N/2; i++ )
        u[ i ] = (double)i / (double)N;
    for( int i=N/2; i<=N; i++ )
        u[ i ] = 1.0 - (double)i / (double)N;
    for( int i=0; i<=N; i++ )
        v[ i ] = u[i];
    for( int i=0; i<=N; i++ )
        w[ i ] = 0.0;

    for( int j=0; j<=200; j++ ) {
        if( ( j % 10 ) == 0 ) {
                                    // 解打出し
            printf( "%5.3lf ", (double)j * k );
            for( int i=0; i<=N; i+=2 )
                printf( "%6.2lf", u[ i ] );
            printf( "\n" );
        }

                                    // 差分計算
        for( int i=1; i<N; i++ )
            w[ i ] = q * ( u[ i + 1 ] + u[ i - 1 ] ) + s * u[ i ]
                     - v[ i ];      // 差分近似式式(6.12)
        for( int i=0; i<=N; i++ ) {
                                    // 計算値書き換え
            v[ i ] = u[ i ];
            u[ i ] = w[ i ];
        }
    }
    return 0;
}