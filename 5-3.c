// 2元連立1階微分方程式

#include    <stdio.h>
#include    <math.h>

#define EPS 0.00000001                       // 許容誤差

double func_f( double, double, double );
double func_g( double, double, double );

int main( int argc, char **argv ) {
    double x = 0.0, y = 3.0, z = 4.0;        // 初期条件
    double h = 0.005, dx = 0.2, xmax = 2.0;  // 刻みなど
    double ry, rz, ddx = 0.0;                // 厳密解
    double b1, b2, b3, b4;
    double c1, c2, c3, c4;

                            // 数値解析
    printf( "%5s %10s %10s %10s %10s\n", "X", "Y", "RY", "Z", "RZ");
                                             // 見出し打出し
    do {
        if( x >= ddx - EPS ) {                       // 打出し条件
            ddx += dx;
            ry = 2.0 * exp( x ) + exp( 2.0 * x );    // 厳密解計算
            rz = 2.0 * exp( x ) + 2.0 * exp( 2.0 * x );
            printf( "%10.4lf %10.4lf %10.4lf %10.4lf %10.4lf\n",
                    x, y, ry, z, rz );
        }                                            // 解打出し

                            // 式(5.28)
        b1 = func_f( x, y, z );
        c1 = func_g( x, y, z );
        b2 = func_f( x + h / 2.0, y + h * b1 / 2.0,
                     z + h * c1 / 2.0 );
        c2 = func_g( x + h / 2.0, y + h * b1 / 2.0,
                     z + h * c1 / 2.0 );
        b3 = func_f( x + h / 2.0, y + h * b2 / 2.0,
                     z + h * c2 / 2.0 );
        c3 = func_g( x + h / 2.0, y + h * b2 / 2.0,
                     z + h * c2 / 2.0 );
        b4 = func_f( x + h      , y + h * b3      ,
                     z + h * c3       );
        c4 = func_g( x + h      , y + h * b3      ,
                     z + h * c3       );

                            // 式(5.27)
        y += ( h / 6.0 ) * ( b1 + 2.0 * b2 + 2.0 * b3 + b4 );
        z += ( h / 6.0 ) * ( c1 + 2.0 * c2 + 2.0 * c3 + c4 );
        x += h;
    } while( x <= xmax );
    return 0;
}

                            // 微分方程式 f( x, y, z ) = z
double func_f( double x, double y, double z ) {
    return z;
}

                            // 微分方程式 g( x, y, z ) = 3z - 2y
double func_g( double x, double y, double z ) {
    return 3.0 * z - 2.0 * y;
}