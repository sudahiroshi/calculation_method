// 正規乱数検証計算

#include    <stdio.h>
#include    <stdlib.h>
#include    <math.h>

#define N   10000                               // 繰り返し回数

double gauss( void );
void print( double, double, int );

int main( int argc, char **argv ) {
    double sa = 0.0, sb = 0.0;
    double v;

    printf( "回数\t平均値\t標準偏差\n" );       // 見出し打出し
    for( int i=1; i<=N; i++ ) {
        v = gauss();
        sa += v;
        sb += v * v;
        if( ( i % 1000 ) == 0 )
            print( sa, sb, i );
    }
    return 0;
}

                                                // 結果打出し
void print( double sa, double sb, int i ) {
    double ave = 0.0, hh, sig;

    ave = sa / (double)i;
    hh = sb - (double)i * ave * ave;
    sig = sqrt( hh / (double)i );
    printf( "%6d %8.4lf %8.4lf\n", i, ave, sig );
}

                                                // 正規乱数生成
double gauss( void ) {
    double ss = 0.0;

    for( int i=0; i<12; i++ )
        ss += rand() / (double)RAND_MAX;
    return ss - 6.0;
}