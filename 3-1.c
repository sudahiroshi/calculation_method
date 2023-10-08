// ラグランジュの補間法

#include    <stdio.h>
#include    <math.h>

#define N   6                                       // データ数

double x[N] = { 0.0, 1.0, 2.0, 3.0, 3.1, 5.0 };     // X 座標
double y[N] = { 0.0, 1.1, 2.5, 4.0, 4.1, 5.0 };     // Y 座標

double lagrange( double );

int main( int argc, char **argv ) {
    double xx, yy;

                                                    // 補間計算
    printf( "XX\t\tYY\n" );                         // 見出し打出し
    for( xx=0.0; xx<=5.0; xx+=.2 ) {
        yy = lagrange( xx );
        printf(" %8.2lf\t%8.2lf\n", xx, yy );       // 補間結果打出し
    }
    return 0;
}

                                                    // 補間
double lagrange( double xx ) {
    double z[N];
    double yy = 0.0;

    for( int k=0; k<N; k++ ) {
        z[k] = 1.0;
                                                    // 係数計算
        for( int i=0; i<N; i++ )
                                                    // 式(3.14)
            if( i != k )
                z[k] *= ( xx - x[i] ) / ( x[k] - x[i] );
                                                    // 補間値計算
        yy += y[k] * z[k];                          // 式(3.13)
    }
    return yy;
}