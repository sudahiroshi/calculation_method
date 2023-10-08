// ルンゲ-クッタの公式を用いた微分方程式の解法

#include    <stdio.h>
#include    <math.h>

#define EPS 0.00000001                              // 許容誤差

double func_f( double, double );

int main( int argc, char **argv ) {
    double x = 0.0, y = 0.0;                        // 初期条件
    double h = 0.01, dx = 1.0, xmax = 10.0;         // 刻みなど
    double ddx = 0.0, k1, k2, k3, k4;

    printf( "X\t Y\n" );                            // 見出し打出し
    do {
        if( x >= ddx - EPS ) {                      // 打出し条件
            ddx += dx;
            printf( "%8.4lf %8.4lf\n", x, y );      // 解打出し
        }

                                                    // 式(5.15)
        k1 = func_f( x          , y                );
        k2 = func_f( x + h / 2.0, y + h * k1 / 2.0 );
        k3 = func_f( x + h / 2.0, y + h * k2 / 2.0 );
        k4 = func_f( x + h      , y + k3 * h       );

                                                    // 式(5.14)
        y += ( h / 6.0 ) * ( k1 + 2.0 * k2 + 2.0 * k3 + k4 );
        x += h;
    } while( x <= xmax + EPS );
    return 0;
}

                                    // 微分方程式 f(x) = 2x 定義
double func_f( double x, double y ) {
    return 2.0 * x;
}