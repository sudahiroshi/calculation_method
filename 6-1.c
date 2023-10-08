// 放物型偏微分方程式

#include    <stdio.h>
#include    <math.h>

#define N   20                       // 刻み設定

int main( int argc, char ** argv ) {
    double u[ N+1 ], w[ N+1 ];       // 配列宣言
    double k = 0.001;
    double h, r, s;

    h = 1.0 / (double)N;             // 定数計算
    r = k / ( h * h );
    s = 1.0 - 2.0 * r;

                                     // 初期条件，境界条件格納
    for( int i=0; i<=N; i++ )
        w[i] = 0.0;
    for( int i=1; i<N; i++ )
        u[i] = 1.0;
    u[0] = 0.0;
    u[N] = 0.0;

                                    // 解打出し
    for( int j=1; j<=200; j++ ) {
        if( ( j % 10 ) == 0 ) {
            printf( "%5.3lf ", (double)j * k );
            for( int i=0; i<=N; i+=2 )
                printf( "%5.3lf ", u[i] );
            printf( "\n" );
        }

                                    // 差分計算
        for( int i=1; i<N; i++ )
            w[i] = r * ( u[i+1] + u[i-1] ) + s * u[i];
                                    // 差分近似式式(6.9)
            // 境界条件w[0]=w[N]=0は不変としているので，
            // 36行目のfor文ではiの値を1～N-1の範囲で変化させる
        for( int i=0; i<=N; i++ )
            u[i] = w[i];            // 計算値置き換え
    }
    return 0;
}