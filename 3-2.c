// 最小2乗法

#include    <stdio.h>
#include    <math.h>

#define N   6                                           // データ数
#define M   2                                           // 回帰曲線の次数
#define EPS 0.0001                                      // 許容誤差

double a[M+1][M+2];

int jordan( void );

int main( int argc, char **argv ) {
    double x[N] = { 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 };     // X 座標
    double y[N] = { 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 };     // Y 座標

    for( int i=0; i<=M; i++ )
        for( int j=0; j<=M+1; j++ )
            a[i][j] = 0.0;

                                                        // 式(3.23)左辺
    for( int i=0; i<=M; i++ )
        for( int j=0; j<=M; j++ )
            for( int k=0; k<N; k++ )
                a[j][i] += pow( x[k], (double)(i+j) );

                                                        // 式(3.23)右辺
    for( int j=0; j<=M; j++ )
        for( int k=0; k<N; k++ )
            a[j][M+1] += y[k] * pow( x[k], (double)j );

    if( jordan() == 1 ) return 1;

                                                        // 係数打出し
    for( int i=0; i<=M; i++ )
        printf( "A%2d = %7.3lf\n", i, a[i][M+1] );
    return 0;
}

// ガウス-ジョルダン法による連立方程式の計算
int jordan( void ) {
    double pivot, delta;
    for( int i=0; i<=M; i++ ) {
        pivot = a[i][i];
        if( fabs( pivot ) < EPS ) {
            printf( "ピボットが許容誤差以下\n" );
            return 1;
        }
        for( int j=i; j<=M+1; j++ )
            a[i][j] /= pivot;

        for( int k=0; k<=M; k++ ) {
            if( k != i ) {
                delta = a[k][i];
                for( int j=i; j<=M+1; j++ )
                    a[k][j] -= delta * a[i][j];
            }
        }
    }
    return 0;
}