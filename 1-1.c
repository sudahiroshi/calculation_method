// 2分法

#include	<stdio.h>
#include	<math.h>

#define EPS	0.0001                              // 許容誤差

double nibun( double, double );
double func_y( double );

    int main( int argc, char **argv ){
    double a = 0.0, b = 1.0;                        // 初期値設定
    double x;                                       // 解

    printf( "x^3 + x - 1 = 0 の2分法による数値計算\n" );
    printf( "初期値a = %6.3lf\n", a );
    printf( "初期値b = %6.3lf\n", b );
    x = nibun( a, b );
    printf( "近似解x = %6.3lf\n", x );              // 解打出し

    return 0;
}

double nibun( double a, double b ){
    double c;

    do{
        c = ( a + b ) / 2.0;                        // 2分計算
        if( ( func_y(c) * func_y(a) ) < 0 ) b = c;  // 式(1.2)
        else a = c;                                 // 式(1.3)
    } while( fabs( a - b ) > EPS ); // 収束判定式(1.4)の変形
    return c;
}

                                    // 関数 y = x^3 + x - 1 定義
double func_y( double x ){
    return pow( x, 3.0 ) + x - 1.0;
}