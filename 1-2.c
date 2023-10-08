// ニュートン法

#include	<stdio.h>
#include	<math.h>

double func_y( double );
double func_z( double );

#define EPS	0.0001                      // 許容誤差

int main( int argc, char **argv ) {
    double a = 1.0;                         // 初期値設定
    double b;                               // 解

    while( 1 ) {
        b = a - func_y( a ) / func_z( a );  // 式(1.9)
        if( fabs( a - b ) < EPS ) break;    // 収束判定
        else a = b;
    }
    printf( "近似解x = %6.3lf\n", b );      // 解打出し
    return 0;
}
                            // 関数 y = x^3 + x - 1 定義
double func_y( double x ) {
    return( pow( x, 3.0 ) + x - 1.0 );
}
                            // 導関数 z = 3x^2 + 1 定義
double func_z( double x ) {
    return( 3.0 * pow( x, 2.0 ) + 1.0 );
}