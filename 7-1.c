// 逆行列の計算

#include    <stdio.h>
#include    <math.h>

#define N   3            // 次数設定
#define EPS 0.00001      // 許容誤差

int main( int argc, char **argv ) {
    double a[N][N] = {   // 配列宣言
        { 2.0, 1.0, 3.0 },
        { 1.0, 3.0, 2.0 },
        { 3.0, 2.0, 1.0 }
    };                   // 係数行列

    double b[N][2*N];
    double pivot, delta;

                        // 配列 b の左半分：係数行列，右半分：単位行列
    for( int y=0; y<N; y++ ) {
        for( int x=0; x<N; x++ ) {
            b[ y ][ x     ] = a[ y ][ x ];
            b[ y ][ x + N ] = 0.0;
        }
        b[ y ][ y + N ] = 1.0;
    }

                        // 掃き出し計算部
    for( int i=0; i<N; i++ ) {
        pivot = b[ i ][ i ];
        if( fabs( pivot ) < EPS ) { // エラー打出し
            printf( "ピボットが許容誤差以下\n" );
            return 1;
        }

        for( int j=1; j<2*N; j++ )
            b[ i ][ j ] /= pivot;
        for( int k=0; k<N; k++ ) {
            delta = b[ k ][ i ];
                        // 配列 b をすべて掃き出す操作
            for( int j=i; j<2*N; j++ )
                if( k != i )
            b[ k ][ j ] -= delta * b[ i ][ j ];
        }
    }

                        // 解打出し部，配列 b の右半分が解答
    for( int y=0; y<N; y++ ) {
        for( int x=N; x<2*N; x++ )
            printf( "%7.3lf ", b[ y ][ x ] );
        printf( "\n" );
    }
    return 0;
}