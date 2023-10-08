// 窓口平均待ち時間計算

#include    <stdio.h>
#include    <stdlib.h>
#include    <math.h>

#define N   30000                // 来行人数
#define M   5                    // 窓口数
#define ALF 1                    // 流れ密度（α）
#define DEL 4                    // 平均処理時間（δ0）
#define SIG 0.5                  // 処理時間のばらつき（σ）
#define EPS 0.000001             // log 計算時のバイアス

int k = 0;                       // 待ち人数

double gauss( void );
void cll( double, double * );
int minimum( double * );
double tim( double, double, double *, double * );
void sentaku( double, double *, double * );
double poison( double );

int main( int argc, char **argv ) {
    double ans = 0.0, time = 0.0;
    double a[ 20 ], b[ 200 ];

    printf( "来行人数平均待ち時間\n" );
    for( int i=0; i< 20; i++ )
        a[ i ] = 0.0;
    for( int i=0; i<200; i++ )
        b[ i ] = 0.0;

    for( int i=1; i<=N; i++ ) {
        time += poison( time );
        ans = tim( ans, time, a, b );
        cll( time, a );
        sentaku( time, a, b );

                                // 解打出し
        if( i % 2000 == 0 )
        printf( "%6d\t%11.6lf\n", i, ans / (double)i );
    }
    return 0;
}
                                // 正規乱数生成
double gauss( void ) {
    double delta = 0.0;

    for( int p=0; p<12; p++ )
        delta += ( (double)rand() / (double)RAND_MAX );
    return( (double)DEL + SIG * ( delta - 6.0 ) );
}

                                // 空き窓口ルーチン
void cll( double time, double a[] ) {

    for( int j=0; j<M; j++ ) {
        if( a[ j ] < time ) {
            a[ j ] = 0.0;
            return;
        }
    }
}

                                // 最短空き窓口
int minimum( double a[] ) {
    int min = M;

    a[ min ] = 100000.0;
    for( int p=0; p<M; p++ )
        if( a[ min ] > a[ p ] )
            min = p;
    return min;
}

                                // 待ち解除ルーチン
double tim( double ans, double time, double a[], double b[] ) {
    int l;
    int min;

    while( k != 0 ) {
        min = minimum( a );

        if( a[ min ] >= time )
            break;

        ans += a[ min ] - b[ 0 ];
        a[ min ] += gauss();
        k--;
        for( l=0; l<k; l++ )
            b[ l ] = b[ l + 1 ];
        b[ l + 1 ] = 0.0;
    }
    return ans;
}

                                // 窓口選択ルーチン
void sentaku( double t, double a[], double b[] ) {

    for( int j=0; j<M; j++ ) {
        if( a[ j ] == 0.0 ) {
        a[ j ] = t + gauss();
        return;
    }
}
    b[ k ] = t;
    k++;
    return;
}
                                // 指数乱数生成
double poison( double t ) {
    double tau;

    tau = -log( (double)rand() / (double)RAND_MAX + EPS )
          / (double)ALF;
    return tau;
}