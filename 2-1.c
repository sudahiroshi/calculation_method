// ガウス-ジョルダン法

#include	<stdio.h>
#include	<math.h>

#define N	3                               // 次元設定
#define EPS	0.001                           // 許容誤差

int main( int argc, char ** argv ) {
    double a[N][N+1] = {
        { 2, 1, 3, 13 },
        { 1, 3, 2, 13 },
        { 3, 2, 1, 10 }
    };                                          // 係数データ
    double pivot, delta;                        // pivot, delta

                                                // 計算部
    for( int i=0; i<N; i++ ) {
        pivot = a[i][i];
        if( fabs( pivot ) < EPS ) {             // 誤差判定
            printf( "ピボットが許容誤差以下\n" );   // エラー打出し
            return 1;
        }
        for( int j=i; j<N+1; j++ )
            a[i][j] /= pivot;                   // pivot = 1

                                                // 掃き出し操作
        for( int k=0; k<N; k++ ) {
            if( k != i ) {
                delta = a[k][i];
                for( int j=i; j<N+1; j++ )
                a[k][j] -= delta * a[i][j];
            }
        }
    }
    for( int l=0; l<N; l++ )
        printf( "X%d = %6.2lf\n", l, a[l][N] );     // 解打出し
    return 0;
}