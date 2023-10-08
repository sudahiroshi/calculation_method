// シンプソンの公式による積分

#include    <stdio.h>
#include    <math.h>

#define N   30                                      // 積分刻み数

double func_y( double );

int main( int argc, char **argv ) {
    double y[ N+1 ];
    double xa = 0.0, xb = 3.0;                      // 積分範囲
    double z1 = 0.0, z2 = 0.0, h = 0.0, x, s;

    h = ( xb - xa ) / (double)N;                    // 刻み計算

                                                    // 関数値計算
    for( int i=0; i<=N; i++ ) {
        x = xa + h * (double)i;
        y[i] = func_y( x );
    }

                                                    // 数値積分
    for( int i=1; i<=N-1; i+=2 )
        z1 += 4.0 * y[i];
    for( int i=2; i<=N-2; i+=2 )
        z2 += 2.0 * y[i];
    s = ( h / 3.0 ) * ( y[0] + z1 + z2 + y[N] );    // 式(4.11)

                                                    // 解打出し
    printf( "ANS = %8.4lf\n", s );
    return 0;
}

double func_y( double x ) {
    return pow( x, 4.0 ) + 2.0 * x;
}