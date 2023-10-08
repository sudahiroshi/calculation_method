// 楕円型偏微分方程式

#include    <stdio.h>
#include    <math.h>

int main( int argc, char **argv ) {
    double u[ 11 ][ 11 ], w[ 11 ][ 11 ];     // 配列宣言
    double dd = 0.0;
    double u1, u2;
    int nh = 10;                        // 刻み

                                        // 初期・境界条件
    for( int i=0; i<nh+1; i++ )
        for( int j=0; j<nh+1; j++ ) {
            u[ i ][ j ] = 0.0;
            w[ i ][ j ] = 0.0;
        }
    for( int i=1; i<nh; i++ )
        u[ i ][ nh ] = 1.0;

                                        // 差分計算（ガウス-ザイデル法）
    do {
        dd = 0.0;
        for( int i=1; i<nh; i++ )
            for( int j=1; j<nh; j++ ) {
                                        // 式(6.15)
                u1 = u[ i + 1 ][ j     ] + u[ i - 1 ][ j     ];
                u2 = u[ i     ][ j + 1 ] + u[ i     ][ j - 1 ];
                u[ i ][ j ] = ( u1 + u2 ) / 4.0;
                dd += fabs( w[ i ][ j ] - u[ i ][ j ] );
                w[ i ][ j ] = u[ i ][ j ];
            }
    } while( dd > 0.001 );

                                        // 解打出し
    for( int i=0; i<=nh; i++ ) {
        for( int j=0; j<=nh; j++ )
            printf( "%6.3lf", u[ i ][ j ] );
        printf( "\n" );
    }
    return 0;
}