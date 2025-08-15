// 台形公式による積分

#include    <stdio.h>
#include    <math.h>

#define N   30                              // 積分刻み数

double func_y( double );

int main( int argc, char **argv ) {
    double y[N+1];
    double xa = 0.0, xb = 3.0;              // 積分範囲
    double z = 0.0, h = 0.0, x, s;

    h = ( xb - xa ) / (double)N;            // 刻み計算

    for( int i=0; i<=N; i++ ) {
        x = xa + h * (double)i;
        y[i] = func_y( x );
    }

                                            // 数値積分
    for( int i=1; i<N; i++ )
        z += 2.0 * y[i];
        s = ( h / 2.0 ) * ( y[0] + z + y[N] );  // 式(4.6)

                                            // 解打出し
    printf( "ANS = %8.4lf\n", s );
    return 0;
}

                            // 被積分関数 x^4 + 2x 定義
double func_y( double x ) {
    return pow( x, 4.0 ) + 2.0 * x;
}