// ガウス-ザイデル法

#include	<stdio.h>
#include	<math.h>

#define N	3                   // 次元設定
#define EPS	0.0001              // 許容誤差
#define MAX_LOOP	30          // 最大繰り返し回数

int main( int argc, char **argv ) {
    double a[N][N+1] = {
        { 5, 1, 1, 10 },
        { 1, 4, 1, 12 },
        { 2, 1, 3, 13 }
    };                              // 係数データ
    double x[N], y[N], s, q;

                                    // 収束計算部
    for( int i=0; i<N; i++ )
        x[i] = 1.0;                 // 解の初期値

    for( int k=0; k<MAX_LOOP; k++ ) {
        q = 0.0;
        for( int i=0; i<N; i++ ) {  // 逐次計算
            s = 0.0;
            for( int j=0; j<N; j++ )
                if( i != j )
                    s += a[i][j] * x[j];
            y[i] = ( a[i][N] - s ) / a[i][i];
            q += fabs( x[i] - y[i] );
            x[i] = y[i];            // 誤差集積
        }
        if( q < EPS ) {             // 誤差判定
            for( int i=0; i<N; i++ )
                printf( "x%d = %9.6lf\n", i, x[i] );    // 解打出し
            return 0;
        }
    }
    printf( "収束せず\n" );         // エラー打出し
    return 1;
}