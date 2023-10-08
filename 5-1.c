// オイラーの前進公式を用いた微分方程式の解法

#include    <stdio.h>
#include    <math.h>

#define EPS 0.00000001                              // 許容誤差

double func_f( double );

int main( int argc, char **argv ) {
    double x = 0.0, y = 0.0;                        // 初期条件
    double h = 0.01, dx = 1.0, xmax = 10.0;         // 刻みなど
    double ddx = 0.0;

    printf( "X\tY\n" );                             // 見出し打出し
    do {
        if( x >= ddx - EPS ) {                      // 打出し条件
            ddx += dx;
            printf( "%7.4lf %7.4lf\n", x, y );      // 解打出し
        }

                                                    // 関数値増加
        y += h * func_f( x );                       // 式(5.4)
        x += h;                                     // 式(5.5)
    } while( x <= xmax + EPS );
    return 0;
}

                                        // 微分方程式 f(x) = 2x 定義
double func_f( double x ) {
    return 2.0 * x;
}